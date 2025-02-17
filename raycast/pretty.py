#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Pretty
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 💅

import json
import subprocess
import xml.etree.ElementTree as ET
from ast import literal_eval
from pprint import pformat


OUTPUT_WIDTH = 70


def try_parse_json(data: str):
    try:
        return json.loads(data)
    except ValueError:
        return None


def try_parse_xml(data: str):
    try:
        return ET.fromstring(data)
    except ET.ParseError:
        return None


def try_parse_raw_python(data):
    try:
        return literal_eval(data)
    except (ValueError, SyntaxError):
        return None


def prettify_json(data):
    if not isinstance(data, str):
        data = json.dumps(data)
    return subprocess.check_output(['underscore', 'print', '--wrapwidth', str(OUTPUT_WIDTH)], input=data.encode('utf-8')).decode('utf-8')


def prettify_xml(data):
    if isinstance(data, str):
        data = try_parse_xml(data)
    ET.indent(data, space='  ', level=0)
    return ET.tostring(data, encoding='utf-8').decode('utf-8')


def prettify_python(data):
    return prettify_json(json.dumps(data))


def extract_from_message(message: str):
    # JSON or literal python
    if ('[' in message and ']' in message) or ('{' in message and '}' in message):
        if '[' in message and '{' in message and ']' in message and '}' in message:
            if message.index('[') < message.index('{'):
                message = '[' + message.partition('[')[-1]
                message = message.rpartition(']')[0] + ']'
            else:
                message = '{' + message.partition('{')[-1]
                message = message.rpartition('}')[0] + '}'
                
        elif '[' in message:
            message = '[' + message.partition('[')[-1]
            message = message.rpartition(']')[0] + ']'
        else:
            message = '{' + message.partition('{')[-1]
            message = message.rpartition('}')[0] + '}'

        if data := try_parse_raw_python(message):
            return prettify_python(data), 'python'
        elif data := try_parse_json(message):
            return prettify_json(data), 'json'

    # XML
    elif '<' in message and '>' in message:
        message = '<' + message.partition('<')[-1]
        message = message.rpartition('>')[0] + '>'
        if (data := try_parse_xml(message)) is not None:
            return prettify_xml(data), 'xml'

    return None


def output(data: str, language: str | None):
    subprocess.run(['pbcopy'], input=data.encode('utf-8'), stdout=subprocess.DEVNULL)

    bat_command = ['bat', '--color', 'always', '--paging', 'never', '--decorations', 'never']
    if language:
        bat_command += ['-l', language]
    subprocess.run(bat_command, input=data.encode('utf-8'))


data = subprocess.check_output(['pbpaste']).decode('utf-8')

# Check if input is json
if json_data := try_parse_json(data):
    # If there's an exc_info field, print it directly
    if isinstance(json_data, dict) and (exc_info := json_data.get('exc_info')):
        output(exc_info, 'python')

    # If there's a message field, go try to extract json, python or xml
    elif isinstance(json_data, dict) and (message := json_data.get('message')) and isinstance(message, str) and (extracted := extract_from_message(message)):
        output(extracted[0], extracted[1])

    # Just output the json directly
    else:
        output(prettify_json(json_data), 'json')

# Check if the input is XML
elif (xml_data := try_parse_xml(data)) is not None:
    output(prettify_xml(xml_data), 'xml')

# Check if the input is literal python
elif python_data := try_parse_raw_python(data):
    output(prettify_python(python_data), 'python')


local module = {}

module.hyperlink_rules = {
	{
		regex = [[(PP|FEAT|INT|FE|QA|CB|SBSS)-\d+]],
		format = "https://mobilevikings.atlassian.net/browse/$0",
	},
}

return module

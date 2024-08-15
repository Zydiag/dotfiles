require('competitest').setup { -- to customize settings
	-- put here configuration
	 received_problems_path = "$(HOME)/coding/c++/problems/$(JUDGE)/$(PROBLEM).$(FEXT)",
	 received_contests_directory = "$(HOME)/coding/c++/contest/$(JUDGE)/$(CONTEST)",

	testcases_use_single_file = true,
	testcases_auto_detect_storage = true,
	-- testcases_single_file_format = "a.testcases",
	-- testcases_input_file_format = "a_input$(TCNUM).txt",

	testcases_directory = "testcases",
	-- running_directory = "compiled",
	-- compile_directory = "compiled",

	compile_command = {
		c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "zz_run" } },
		cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "zz_run" } },
	},
	run_command = {
		c = { exec = "./zz_run" },
		cpp = { exec = "./zz_run" },
	},

}


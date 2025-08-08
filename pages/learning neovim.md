---
title: learning neovim
---

- intro
	 - modes
		 - I - insert

		 - V - visual

		 - : - command

	 - navigation - in COMMAND mode
		 - hjkl - for character and line by line basis

		 - w - move to next word

		 - shift w - for next word including next whitespace (good to navigate between lines and forms)

		 - b - previous word

		 - shift b - previous word including next whitespace

		 - ctrl n - move to next line

		 - e - end of word or end of next word

		 - u - undo last change

		 - ctrl r - redo chences which were undone

		 - vim-sexp - https://github.com/guns/vim-sexp#mappings
			 - ]] and [[ - move cursor to an adjacent top level element

			 - == indent compound form without moving cursor

			 - =- indent current top-level compound form without moving cursor
				 - ]e and [e - SELECT an adjacent element

			 - Selecting in VISUAL mode
				 - if - select compound form without parens

				 - af - select compound form including parens

				 - aF - select top level form including parens

				 - iF - select top level form without parens

				 - as - select string including quotes

				 - is - select string excluding quotes

				 - ae & ie - select element

			 - List manipulation
				 - http://www.micahelliott.com/posts/2015-08-20-vim-sexp-cheat-sheet.html

				 - <f and >f - move a form forwards or backwards

				 - <e and >e - move an element

				 - slurp and barf
					 - slurping is expanding the expression by **pulling in** elements from the **outer** s-expression

					 - barfing is contracting it by **pushing out** from inside towards outside the s-expression

					 - angle bracket indicates direction

					 - parens indicates which end to operate on

					 - - <) - from the end of the from exclude

					 - - >) - at the end of the form include

					 - - <( - include stuff from the beginning of the form

					 - - >( - exclude stuff from the beginning of the form

				 - insertion relative to the form
					 - - >I - insert at the beginning of the form

					 - - <I - insert at the end of the form

				 - dsf - splice

				 - cse - command surround element
					 - cse( or cseb - surrounds with parens

					 - cse[ - surrounds with brackets

					 - cse{ - surrounds with braces

	 - auto-complete - using CoC
		 - ctrl n & ctrl p - pick from the autocomplete options

	 - conjure - connection to the Clojure REPL
		 - Evaluating
			 - ,eb - eval buffer

			 - ,ee - eval current inner form

			 - ,er - eval outermost form

			 - ,e! - eval and replace the form with the result

			 - mark with mf - ,emf - eval form at mark

			 - ,ew - check contents of a variable

			 - switch to visual mode (press V) - make selection - then ->  ,E - eval selection

			 - ,Eiw - evaluate a word

			 - ,Ea( - evaluate lesson form

		 - Looking at the result
			 - log buffers - useful after evals
				 - open
					 - ,ls - horizontal log buffer

					 - ,lv - vertical log buffer

					 - ,lt - new tab log buffer

				 - close
					 - ,lq

		 - 

	 - config
		 - leader key - set to comma ,

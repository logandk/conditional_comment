conditional_comment - Smart IE Conditional Comments
=================================================

This is a Ruby on Rails plugin, which provides a clever helper for creating conditional comments for Internet Explorer.
If you are unsure of how conditional comments work, details can be found at [msdn](http://msdn.microsoft.com/en-us/library/ms537512%28VS.85%29.aspx).



Installation
============

As a Rails Plugin
-----------------

Use this to install as a plugin in a Ruby on Rails app:

	$ script/plugin install git://github.com/logandk/conditional_comment.git


As a Rails Plugin (using git submodules)
----------------------------------------

Use this if you prefer the idea of being able to easily switch between using edge or a tagged version:

	$ git submodule add git://github.com/logandk/conditional_comment.git vendor/plugins/conditional_comment



Usage
=====

After installation, a helper called `conditional_comment` will automatically be available to all your views. Here are some usage examples:

	conditional_comment do
		stylesheet_link_tag "site/ie.css"
	end

In this case, the stylesheet will be shown in all versions of Internet Explorer.

You can limit which versions of Internet Explorer should display the contents of the conditional comment, using the `:version` parameter. This parameter accepts a number, string or symbol using the following syntax: `[not] [less|greater than [or equal to]] [version]`. Here are some examples:

	conditional_comment :version => 7 do
		stylesheet_link_tag "site/ie.css" # Displayed in IE 7
	end


	conditional_comment :version => "less than 7" do
		stylesheet_link_tag "site/ie.css" # Displayed in IE 6 and below
	end


	conditional_comment :version => "greater than or equal to 5" do
		stylesheet_link_tag "site/ie.css" # Displayed in IE 5 and above
	end


	conditional_comment :version => "not 6" do
		stylesheet_link_tag "site/ie.css" # Displayed in everything besides IE 6
	end


	conditional_comment :version => :less_than_6 do
		stylesheet_link_tag "site/ie.css" # Displayed in IE 5 and below
	end


Credits
=======
Copyright (c) 2009 Logan Raarup, released under the MIT license

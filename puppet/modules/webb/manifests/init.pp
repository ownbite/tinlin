
class webb(
	
) inherits webb::params {

	# Include python
	class { "webb::python-settings": }

	# Include git
	class { "webb::git-settings": }

	# Include grunt
	class { "webb::grunt-settings": }

	# Include nginx
	# class { "webb::nginx-settings": }

	#Class["webb::python"] -> Class["webb::mysql"] -> Class["webb::nginxconf"] # -> Class["webb::drupal"] 

}



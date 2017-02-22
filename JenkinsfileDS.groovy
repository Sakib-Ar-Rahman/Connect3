pipeline {
	agent any
	
	stages {

		stage ('Build') {
			steps {
				sh '''
					echo building
				'''
			}
		} 

		stage ('Upload to Veracode') {
			steps {
				sh '''
					echo uploading build to Veracode
				'''
			}
		}

	}
}
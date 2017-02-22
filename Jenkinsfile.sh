#!groovy

// Android Jenkinsfile

node {
    stage('Build') {
        echo 'Building....'
    }
    stage('Test') {
    	echo 'Building....'

        checkout scm
  		sh '''

	    echo 'Checking out gradle wrapper'

	    git checkout gradle

	    # enabling 'Jenkins' mode in gradle:
	    sed -i -e 's/def automatedBuild *= *false/def automatedBuild = true/g' build.gradle

	    
	    

	    ./gradlew wrapper # in case someone updates the build-tools
	    echo 'Building...'
	    pwd
	    ./gradlew clean
        ./gradlew assemble



        '''


    }
    stage('Deploy') {
        echo 'Deploying....'
    }
}
#!groovy

// Android Jenkinsfile

stage 'Get_External_Shell_Scripts'
node {

    try{
        stage('Build') {
            checkout scm
            
            sh '''
            echo 'Checking out gradle wrapper'
            cd tictactoe
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
        stage('Test') {
        	echo 'Testing....'

            


        }
        stage('Deploy') {
            echo 'Deploying....'
        }
    }
    catch(e){
      slackSend color: "FF0000", message: "JENKINS ALERT! - BUILD FAILURE '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' \n ${env.BUILD_TIMESTAMP} \n ${env.BUILD_URL}"
      currentBuild.result = "FAILED"
      throw e
    }

}
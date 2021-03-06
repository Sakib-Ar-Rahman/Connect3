#!groovy

// Android Jenkinsfile

stage 'Get_External_Shell_Scripts'
node {

    try{
        stage('Build') {
            checkout scm
            echo 'Building....'
            
            // sh '''
            // echo 'Checking out gradle wrapper'
            // # cd tictactoe
            // # git checkout gradle

            // # enabling 'Jenkins' mode in gradle:
            // # sed -i -e 's/def automatedBuild *= *false/def automatedBuild = true/g' build.gradle

            // ./gradlew wrapper # in case someone updates the build-tools
            // echo 'Building...'
            // pwd
            // ./gradlew clean
            // ./gradlew assemble

            // '''
        }
        stage('Test') {
        	echo 'Testing....'


            


        }
        stage('Deploy') {
            echo 'Deploying....'
            echo 'some more changes'
    
        }


        stage('Send to Veracode'){

        
            
            sh '''
            echo 'Existing Branch name'
            echo ${env.BUILD_ID}

            if [ -z "$BRANCH_NAME" ]; then
                BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
            fi
            for FILENAME in tictactoe/*.apk
                do NEWFILENAME=$FILENAME"_"$BRANCH_NAME
            done
            echo $BRANCH_NAME
            echo $NEWFILENAME


            '''

            echo "$pwd"



            
            



            // veracode applicationName: 'UGO - UGO Digital Wallet - Android', createSandbox: true, criticality: 'VeryHigh', fileNamePattern: '', pHost: '', pPassword: '', pUser: '', replacementPattern: '', sandboxName: 'Sandbox Testing Sakib3', scanExcludesPattern: '', scanIncludesPattern: '', scanName: '$NEWFILENAME-Build-$buildnumber-Time-$timestamp', uploadExcludesPattern: '', uploadIncludesPattern: '**/**.jar, **/**.apk', useIDkey: true, vid: '19705c94f457345b9b9a809015525fcb', vkey: '7dd5d6f7c35d9cab66eaf4ee40c93a0ebf26b60ba505fadedf78c64452cd7d914ddd4e231e098a2bf64f70244750a62c58c3318bc5f5226186dd71fcedda4620', vpassword: '', vuser: ''

        }

    }
    
    catch(e){
      // slackSend color: "FF0000", message: "JENKINS ALERT! - BUILD FAILURE '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' \n ${env.BUILD_TIMESTAMP} \n ${env.BUILD_URL}"
      currentBuild.result = "FAILED"
      throw e
    }

}
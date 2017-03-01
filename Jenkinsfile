// Android Jenkinsfile

stage 'Get_External_Shell_Scripts'
node {

    // try{
        stage('Build') {
            
            echo 'Building....'
		
// Delete later
            
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


            echo 'Veracode Scan Stage Starting'
            echo 'Naming the file'
            sh '''echo $BUILD_ID
            echo $BRANCH_NAME

            if [ -z "$BRANCH_NAME" ]; then
                BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
            fi

            #get the commit message
            #if developer did not request a scan then there is no need to do anything
            commit_message=$(git log -n 1 --pretty=%s)

            #search for the scan keyword within the commit message

            if echo "$commit_message" | grep -q "Scan=True"
            then
                echo "Scan requested, uploading to veracode"
                echo "True" > scan.txt
            else
                echo "No Scan requested, will not upload to veracode"
                echo "False" > scan.txt
            fi


            for FILENAME in tictactoe/*.apk
                do PATHNAME=tictactoe/
                FILEPATHNAME=$FILENAME"_"$BRANCH_NAME
                FILENAME=${FILEPATHNAME#$PATHNAME}
                echo $FILENAME
                echo Saving name in an output file
                echo $FILENAME > output_file_name.txt
            done
            '''

            echo 'Retrieving name from output file'
            script {
                    env.FILENAME = readFile 'output_file_name.txt'
                    echo env.FILENAME

                    def file1 = new File('scan.txt')
                    def lines = .readLines()
                    

                    echo 'Reading Scan File'
                    env.FLAG = readFile 'scan.txt'

            }
            echo "${env.FLAG}"

            if (false){
                echo 'False reached'
            }else{
                echo 'True reached'
            }


            // veracode applicationName: 'UGO - UGO Digital Wallet - Android', createSandbox: true, criticality: 'VeryHigh', fileNamePattern: '', pHost: '', pPassword: '', pUser: '', replacementPattern: '', sandboxName: 'Sandbox Testing Sakib', scanExcludesPattern: '', scanIncludesPattern: '', scanName: '$NEWFILENAME-Build-$buildnumber-Time-$timestamp', uploadExcludesPattern: '', uploadIncludesPattern: '**/**.jar, **/**.apk', useIDkey: true, vid: '19705c94f457345b9b9a809015525fcb', vkey: '7dd5d6f7c35d9cab66eaf4ee40c93a0ebf26b60ba505fadedf78c64452cd7d914ddd4e231e098a2bf64f70244750a62c58c3318bc5f5226186dd71fcedda4620', vpassword: '', vuser: ''
           
        }

    // }
    
    // catch(e){
    //   slackSend color: "FF0000", message: "JENKINS ALERT! - BUILD FAILURE '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' \n ${env.BUILD_TIMESTAMP} \n ${env.BUILD_URL}"
    //   currentBuild.result = "FAILED"
    //   throw e
    // }

}


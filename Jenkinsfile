//Android Jenkinsfile

pipeline {

	agent any
	
	stages {

		stage ('Building') {
			steps {
				sh '''
					echo building...
					#./gradlew clean
					#./gradlew build
				'''
			}
		} 

		stage ('Upload to Veracode') {
			steps {
				sh '''
					#get the commit message
					#if developer did not request a scan then there is no need to do anything
					commit_message=$(git log -n 1 --pretty=%s)
					echo $commit_message
					#search for the scan keyword within the commit message
					if echo "$commit_message" | grep -q "Veracode=True"
					then
						echo "Scan requested, uploading to veracode"
						echo "True" > scan.txt
					else
						echo "No Scan requested, will not upload to veracode"
						echo "False" > scan.txt
					fi
					#echo $BUILD_NUMBER
					#echo $BRANCH_NAME
					#Check path
					#File name changes

					if [ -z "$BRANCH_NAME" ]; then
			            BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
			            echo This is the branch name:
			            echo $BRANCH_NAME
			            echo "Branch name obtained above"
			        fi
			        echo This is the branch name:
			            echo $BRANCH_NAME
			            echo "Branch name obtained above"
		            for FILENAME in tictactoe/*.apk
		                do PATHNAME=tictactoe/
		                FILEPATHNAME=$FILENAME
		                FILENAME=${FILEPATHNAME#$PATHNAME}
		                echo $FILENAME
		                echo Saving name in an output file
		                echo $FILENAME > output_file_name.txt
		            done
					'''


				// save the apk file name in an environment variable
				script {
					env.FILENAME = readFile 'output_file_name.txt'
					env.TEXT = readFile 'scan.txt'

					if (env.TEXT.contains("True")) {
						echo "Ready to scan!"
						veracode applicationName: 'UGO - UGO Digital Wallet - Android', createProfile: false, createSandbox: true, criticality: 'VeryHigh', fileNamePattern: '', pHost: '', pPassword: '', pUser: '', replacementPattern: '', sandboxName: 'Sandbox Testing Sakib3', scanExcludesPattern: '', scanIncludesPattern: '', scanName: "${BRANCH_NAME} ${env.FILENAME}", uploadExcludesPattern: '', uploadIncludesPattern: '**/**.jar', useIDkey: true, vid: 'bff67dd63d41f4331068e44ae216bbe4', vkey: 'e78160940b40a58ec04001889062e577007516ae8387e684ed2b99a8bba6bdc07a2366f8d127fd51b59bb52848ca6c19c835a99741507a002a76fda1191f5153', vpassword: '', vuser: ''
					} else {
						echo "Scan is a no go"
					}
				}

				echo "Content in the scan.txt"
				echo "${env.TEXT}"
				
				
				sh '''
					rm output_file_name.txt
					rm scan.txt
				'''
			}

		}
	}
}
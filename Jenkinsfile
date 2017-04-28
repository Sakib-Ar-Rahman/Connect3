pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh '''
                    echo building...
                    #./gradlew clean
                    #./gradlew build

                    echo "Dalton Branch"
                '''
            }
        }
        stage ('Upload to Veracode') {
            steps {
                sh '''
                    #get the commit message
                    #if developer did not request a scan then there is no need to do anything
                    flag="Veracode=True"

                    commit_message=$(git log -n 1 --pretty=%s)
                    echo $commit_message
                    #search for the scan keyword within the commit message
                    if echo "$commit_message" | grep -q "$flag"
                    then
                        echo "Scan requested, uploading to veracode"
                        echo "True" > scan.txt
                    else
                        echo "No Scan requested, will not upload to veracode"
                        echo "False" > scan.txt
                         
                    '''
  
                
                // save the apk file name in an environment variable
                script {                  
                    env.TEXT = readFile 'scan.txt'
  
                    if (env.TEXT.contains("True")) {
                        echo "Ready to scan!"
                        veracode applicationName: 'UGO - UGO Digital Wallet - Android', createProfile: false, createSandbox: true, criticality: 'VeryHigh', fileNamePattern: '', pHost: '', pPassword: '', pUser: '', replacementPattern: '', sandboxName: 'Sandbox Testing Sakib3', scanExcludesPattern: '', scanIncludesPattern: '', scanName: "SomeName", uploadExcludesPattern: '', uploadIncludesPattern: '**/**.jar', useIDkey: true, vid: 'bff67dd63d41f4331068e44ae216bbe4', vkey: 'e78160940b40a58ec04001889062e577007516ae8387e684ed2b99a8bba6bdc07a2366f8d127fd51b59bb52848ca6c19c835a99741507a002a76fda1191f5153', vpassword: '', vuser: ''
                    } else {
                        echo "Scan is a no go"
                    }
                }



                echo "Content in the scan.txt"
                echo "${env.TEXT}"
                
                sh '''
                    rm scan.txt
                '''
            }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
}
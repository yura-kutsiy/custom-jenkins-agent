pipeline { 
    agent { label "popeye" }  // kaniko
    options {
        ansiColor('xterm')
        timestamps ()
        buildDiscarder(logRotator(numToKeepStr: '10'))
        // skipDefaultCheckout true
    }
    stages {
    //         stage('Build') { 
    //             steps { 
    //             withCredentials([file(credentialsId: 'config.json', variable: 'FILE')]) {
    // //              sh 'use $FILE'
    //                 container('kaniko') {
    //                     script {
    //                         sh '''
    //                             cat $FILE > /kaniko/.docker/config.json
    //                             /kaniko/executor --context `pwd` \
    //                                              --destination yurasdockers/popeye:sh01
    //                         '''
    //                         }
    //                     }
    //                 }           
    //             }
    //         }
        stage('Test'){
            steps {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){
                sh 'echo "testing will be here"'
                container('popeye') {
                        script {
                            sh '''
                                popeye -o junit --save --output-file tesJunit
                            '''
                        }
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "deploy with GitOps" && sleep 300'
            }
        }
    }
}
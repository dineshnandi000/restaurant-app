node() {
    timeout(time: 2, unit: 'HOURS') {
        def err = null;

        try {
            execStage('Clean Workspace', CLEAN_WORKSPACE,{
                deleteDir()
            })

            execStage('Checkout scm', SCM_CHECKOUT,{
                checkout scm
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']]
                ])
            })

            execStage('Main Build', MAIN_BUILD,{
                sh "mvn clean install"
            })
        }catch(error){
            println "Error while executing Pipeline for Restaurant API : " + error
            err=error
        }finally{
            if(err){
                throw err;
            }
        }

    }
}
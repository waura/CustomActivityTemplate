
android {
    packagingOptions {
        exclude 'META-INF/LICENSE.txt'
        exclude 'META-INF/NOTICE.txt'
        exclude 'META-INF/license.txt'
        exclude 'META-INF/notice.txt'
        exclude 'META-INF/LICENSE'
        exclude 'META-INF/NOTICE'
        exclude 'META-INF/NOTICE.txt'
        exclude 'LICENSE.txt'
        exclude 'NOTICE.txt'
        exclude 'license.txt'
        exclude 'notice.txt'
        exclude 'LICENSE'
        exclude 'NOTICE'
    }

    signingConfigs {
        release {
            try {
                storeFile file(productKeyStore)
                keyAlias productKeyAlias
                storePassword productKeyStorePassword
                keyPassword productKeyAliasPassword
            } catch (ex) {
                throw new InvalidUserDataException("You should define productKey settings in gradle.properties.")
            }
        }
    }

    buildTypes {
        release {
            debuggable false
            zipAlignEnabled true
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release
        }
    }

    lintOptions {
        abortOnError false
    }
	
}

dependencies {
    <#if dependencyList?? >
    <#list dependencyList as dependency>
    compile '${dependency}'
    </#list>
    </#if>
}

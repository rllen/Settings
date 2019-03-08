# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /home/jc/Android/Sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#TODO, need remove it.
-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile
# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:\Android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
-keepclassmembers class fqcn.of.javascript.interface.for.webview {
   public *;
}

#指定代码的压缩级别
-optimizationpasses 5

#包明不混合大小写
-dontusemixedcaseclassnames

#不去忽略非公共的库类
-dontskipnonpubliclibraryclasses

 #优化  不优化输入的类文件
-dontoptimize

 #预校验
-dontpreverify

 #混淆时是否记录日志
-verbose

 # 混淆时所采用的算法
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

#保护注解
-keepattributes *Annotation*

# 保持哪些类不被混淆
-keep public class * extends android.app.Fragment
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService
#如果有引用v4包可以添加下面这行
-keep public class * extends android.support.v4.app.Fragment


#忽略警告
-dontwarn
-ignorewarnings

##记录生成的日志数据,gradle build时在本项目根目录输出##
#apk 包内所有 class 的内部结构
-dump proguard/class_files.txt
#未混淆的类和成员
-printseeds proguard/seeds.txt
#列出从 apk 中删除的代码
-printusage proguard/unused.txt
#混淆前后的映射
-printmapping proguard/mapping.txt
########记录生成的日志数据，gradle build时 在本项目根目录输出-end######

#如果引用了v4或者v7包
-dontwarn android.support.**

####混淆保护自己项目的部分代码以及引用的第三方jar包library-end####



#保持 native 方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}

#保持自定义控件类不被混淆
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

#保持自定义控件类不被混淆
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}

#保持 Parcelable 不被混淆
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

#保持 Serializable 不被混淆
-keepnames class * implements java.io.Serializable

#保持 Serializable 不被混淆并且enum 类也不被混淆
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    !static !transient <fields>;
    !private <fields>;
    !private <methods>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

#保持枚举 enum 类不被混淆
-keepclassmembers enum * {
  public static **[] values();
  public static ** valueOf(java.lang.String);
}

-keepclassmembers class * {
    public void *ButtonClicked(android.view.View);
}

#不混淆资源类
-keepclassmembers class **.R$* {
    public static <fields>;
}

#避免混淆泛型 如果混淆报错建议关掉
#-keepattributes Signature

#移除Log类打印各个等级日志的代码，打正式包的时候可以做为禁log使用，这里可以作为禁止log打印的功能使用，另外的一种实现方案是通过BuildConfig.DEBUG的变量来控制
#-assumenosideeffects class android.util.Log {
#    public static *** v(...);
#    public static *** i(...);
#    public static *** d(...);
#    public static *** w(...);
#    public static *** e(...);
#}

#############################################################################################
########################                 以上通用           ##################################
#############################################################################################



#######################     常用第三方模块的混淆选项         ###################################
#retrofit2
-dontwarn okio.**
-dontwarn javax.annotation.**

#dom4j
-keep class org.dom4j.** { *; }

#xutils
-keep class com.lidroid.** { *; }
-keep class * extends java.lang.annotation.Annotation { *; }

#iflytek
-keep class com.iflytek.** { *; }
-keepattributes Signature

#baidu
-keep class com.baidu.speech.**{*;}
-keep class com.baidu.tts.**{*;}
-keep class com.baidu.speechsynthesizer.utility.** {*;}

#Youdao
-keep class com.youdao.sdk.ydtranslate.** { *;}
-keep class com.youdao.ocr.online.** { *;}

#Bing
-keep class com.microsoft.**{*;}
-keep class org.xutils.** {*;}

#Zhidou
-keep class link.zhidou.translator.engines.stt.baidu.ApiRecogResponse { *; }
-keep class link.zhidou.translator.engines.stt.baidu.BaiduTokenResponse { *; }
-keep class link.zhidou.translator.policy.Item { *; }
-keep class link.zhidou.translator.policy.SttPolicy { *; }
-keep class link.zhidou.translator.policy.TtsPolicy { *; }
-keep class link.zhidou.translator.engines.stt.** { *; }
-keep class link.zhidou.translator.engines.translate.** { *; }
-keep class link.zhidou.translator.engines.tts.** { *; }
-keep class link.zhidou.translator.model.bean.** { *; }
-keep class link.zhidou.translator.model.bean.interfacebean.** { *; }
-keep class link.zhidou.translator.model.bean.google.** { *; }
-keep class link.zhidou.translator.model.net.** { *; }
-keep class link.zhidou.translator.assist.CrashResp { *; }
-keep class link.zhidou.translator.assist.CrashResp$* { *; }
-keep class link.zhidou.appupdate.bean.** {*;}
-keep class link.zhidou.translator.engines.translate.baidu.TranslateResult { *; }
-keep class link.zhidou.translator.engines.translate.baidu.TranslateResult$* { *; }
-keep class link.zhidou.translator.engines.stt.baidu.RecogResult { *; }
-keep class link.zhidou.translator.engines.translate.youdao.YoudaoTranslateBean {*;}
-keep class link.zhidou.translator.engines.translate.sogou.TranslateResp { *; }

# Suppress warnings from gRPC dependencies
-dontwarn com.google.common.**
-dontwarn com.google.api.client.**
-dontwarn com.google.protobuf.**
-dontwarn io.grpc.**
-dontwarn okio.**
-dontwarn com.google.errorprone.annotations.**
-keep class io.grpc.internal.DnsNameResolveProvider
-keep class io.grpc.okhttp.OkHttpChannelProvider

#Google translate
-keep class com.google.** {*;}
-keep interface com.google.** {*;}
-dontwarn com.google.**

# RongCloud SDK
-keepattributes Exceptions,InnerClasses
-keepattributes Signature
-keep class io.rong.** {*;}
-keep class * implements io.rong.imlib.model.MessageContent {*;}
-dontwarn io.rong.push.**
-dontnote com.xiaomi.**
-dontnote com.google.android.gms.gcm.**
-dontnote io.rong.**
-keep class link.zhidou.translator.im.GroupNotify { *; }
-keep class link.zhidou.translator.im.GroupNotifyData { *; }


#okhttp3
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**
-keep class okhttp3.internal.publicsuffix.PublicSuffixDatabase
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

#youmeng
-keep class com.umeng.** {*;}

-keepclassmembers class * {
   public <init> (org.json.JSONObject);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

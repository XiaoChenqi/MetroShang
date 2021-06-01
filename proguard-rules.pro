# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/gary/Library/Android/sdk/tools/proguard/proguard-android.txt
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
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#############################################
#
# 对于一些基本指令的添加
#
#############################################
# 代码混淆压缩比，在0~7之间，默认为5，一般不做修改
-optimizationpasses 5

# 混合时不使用大小写混合，混合后的类名为小写
-dontusemixedcaseclassnames

# 指定不去忽略非公共库的类
-dontskipnonpubliclibraryclasses

# 这句话能够使我们的项目混淆后产生映射文件
# 包含有类名->混淆后类名的映射关系
-verbose

# 指定不去忽略非公共库的类成员
-dontskipnonpubliclibraryclassmembers

# 不做预校验，preverify是proguard的四个步骤之一，Android不需要preverify，去掉这一步能够加快混淆速度。
-dontpreverify

# 保留Annotation不混淆
-keepattributes *Annotation*,InnerClasses

# 避免混淆泛型
-keepattributes Signature

# 抛出异常时保留代码行号
-keepattributes SourceFile,LineNumberTable

# 指定混淆是采用的算法，后面的参数是一个过滤器
# 这个过滤器是谷歌推荐的算法，一般不做更改
-optimizations !code/simplification/cast,!field/*,!class/merging/*


#############################################
#
# Android开发中一些需要保留的公共部分
#
#############################################

# 保留我们使用的四大组件，自定义的Application等等这些类不被混淆
# 因为这些子类都有可能被外部调用
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.view.View
-keep public class com.android.vending.licensing.ILicensingService


# 保留support下的所有类及其内部类
-keep class android.**{*;}
-keep class android.support.** {*;}

# 保留继承的
-keep public class * extends android.support.v4.**
-keep public class * extends android.support.v7.**
-keep public class * extends android.support.annotation.**
-keep class * extends android.support.v4.app.FragmentManager{ *; }
-keepclasseswithmembernames class android.support.v4.widget.ViewDragHelper{ *; }

# 保留R下面的资源
-keep class **.R$* {*;}

# 保留本地native方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}

# 保留在Activity中的方法参数是view的方法，
# 这样以来我们在layout中写的onClick就不会被影响
-keepclassmembers class * extends android.app.Activity{
    public void *(android.view.View);
}

# 保留枚举类不被混淆
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# 保留我们自定义控件（继承自View）不被混淆
-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# 保留Parcelable序列化类不被混淆
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# 保留Serializable序列化的类不被混淆
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

# 对于带有回调函数的onXXEvent、**On*Listener的，不能被混淆
-keepclassmembers class * {
    void *(**On*Event);
    void *(**On*Listener);
}

# webView处理，项目中没有使用到webView忽略即可
-keepclassmembers class fqcn.of.javascript.interface.for.webview {
    public *;
}
-keepclassmembers class * extends android.webkit.webViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.webViewClient {
    public void *(android.webkit.webView, java.lang.String);
}

##---------------组件化引入依赖--------------

-dontwarn me.yokeyword.**
-keep class me.yokeyword.**{*;}

-dontwarn org.reactivestreams.**
-keep class org.reactivestreams.**{*;}

-dontwarn org.hamcrest.**
-keep class org.hamcrest.**{*;}

-dontwarn org.androidannotations.**
-keep class org.androidannotations.**{*;}

-dontwarn javax.inject.**
-keep class javax.inject.**{*;}

-dontwarn javax.annotation.**
-keep class javax.annotation.**{*;}

-dontwarn io.reactivex.**
-keep class io.reactivex.**{*;}

-dontwarn de.hdodenhof.circleimageview.**
-keep class de.hdodenhof.circleimageview.**{*;}

-dontwarn com.youth.banner.**
-keep class com.youth.banner.**{*;}

-dontwarn com.tencent.wcdb.**
-keep class com.tencent.wcdb.**{*;}

-dontwarn com.squareup.**
-keep class com.squareup.**{*;}

-dontwarn okio.**
-keep class okio.**{*;}

-dontwarn okhttp3.**
-keep class okhttp3.**{*;}

-dontwarn com.scwang.smartrefresh.**
-keep class com.scwang.smartrefresh.**{*;}

-dontwarn com.qmuiteam.qmui.**
-keep class com.qmuiteam.qmui.**{*;}

-dontwarn com.mob.**
-keep class com.mob.**{*;}

-dontwarn com.makeramen.roundedimageview.**
-keep class com.makeramen.roundedimageview.**{*;}

-dontwarn com.lzy.okgo.**
-keep class com.lzy.okgo.**{*;}

-dontwarn com.luojilab.**
-keep class com.luojilab.**{*;}

-dontwarn com.joanzapata.**
-keep class com.joanzapata.**{*;}

-dontwarn com.iarcuschin.simpleratingbar.**
-keep class com.iarcuschin.simpleratingbar.**{*;}

-dontwarn com.zhy.view.flowlayout.**
-keep class com.zhy.view.flowlayout.**{*;}

-dontwarn com.haibin.calendarview.**
-keep class com.haibin.calendarview.**{*;}

-dontwarn com.gyf.barlibrary.**
-keep class com.gyf.barlibrary.**{*;}

-dontwarn com.google.**
-keep class com.google.**{*;}

-dontwarn javax.annotation.**
-keep class javax.annotation.**{*;}

-dontwarn com.zlw.main.recorderlib.**
-keep class com.zlw.main.recorderlib.**{*;}

-dontwarn com.yalantis.ucrop.**
-keep class com.yalantis.ucrop.**{*;}

-dontwarn com.luck.picture.lib.**
-keep class com.luck.picture.lib.**{*;}

-dontwarn com.fm.tool.scan.**
-keep class com.fm.tool.scan.**{*;}

-dontwarn com.fm.tool.network.**
-keep class com.fm.tool.network.**{*;}

-dontwarn com.cktim.camera2library.**
-keep class com.cktim.camera2library.**{*;}

-dontwarn com.github.mikephil.charting.**
-keep class com.github.mikephil.charting.**{*;}

-dontwarn com.mcxtzhang.swipemenulib.**
-keep class com.mcxtzhang.swipemenulib.**{*;}

-dontwarn com.github.lzyzsd.circleprogress.**
-keep class com.github.lzyzsd.circleprogress.**{*;}

-dontwarn ezy.ui.layout.**
-keep class ezy.ui.layout.**{*;}

-dontwarn com.github.czy1121.loadinglayout.**
-keep class com.github.czy1121.loadinglayout.**{*;}

-dontwarn com.chad.library.**
-keep class com.chad.library.**{*;}

-dontwarn com.bumptech.glide.**
-keep class com.bumptech.glide.**{*;}

-dontwarn com.flyco.tablayout.**
-keep class com.flyco.tablayout.**{*;}

-dontwarn com.contrarywind.**
-keep class com.contrarywind.**{*;}

-dontwarn com.bigkoo.pickerview.**
-keep class com.bigkoo.pickerview.**{*;}

-dontwarn com.blankj.utilcode.util.**
-keep class com.blankj.utilcode.util.**{*;}

-dontwarn com.bigkoo.convenientbanner.**
-keep class com.bigkoo.convenientbanner.**{*;}

-dontwarn com.amap.api.**
-keep class com.amap.api.**{*;}

-dontwarn com.autonavi.**
-keep class com.autonavi.**{*;}

-dontwarn com.loc.**
-keep class com.loc.**{*;}

-dontwarn cn.bingoogolapple.qrcode.**
-keep class cn.bingoogolapple.qrcode.**{*;}

-dontwarn cn.smssdk.**
-keep class cn.smssdk.**{*;}

-dontwarn com.alibaba.**
-keep class com.alibaba.**{*;}

-keep class com.just.agentweb.** {
    *;
}
-dontwarn com.just.agentweb.**

-keepclassmembers class com.just.agentweb.sample.common.AndroidInterface{ *; }

#组件化依赖混淆规则 https://github.com/luojilab/DDComponentForAndroid

-keep interface * {
  <methods>;
}
-keep class com.luojilab.component.componentlib.** {*;}
-keep class com.luojilab.router.** {*;}
-keep class com.luojilab.gen.** {*;}
-keep class * implements com.luojilab.component.componentlib.router.ISyringe {*;}
-keep class * implements com.luojilab.component.componentlib.applicationlike.IApplicationLike {*;}

##---------------okhttp3---------------

-dontwarn okio.**
-dontwarn okhttp3.**
-dontwarn com.squareup.**
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

-dontwarn javax.lang.model.element.Element
-keep class javax.lang.model.element.Element

##-----------------gson-----------------
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.**{ *; }
-keep class com.google.gson.examples.android.model.**{ *; }
-keep class com.google.gson.**{ *;}

##-----------android 工具类库混淆 -----------
# https://github.com/Blankj/AndroidUtilCode
-keep class com.blankj.utilcode.** { *; }
-keepclassmembers class com.blankj.utilcode.** { *; }
-dontwarn com.blankj.utilcode.**

##-----------zbar 二维码扫描 --------------
-keepclassmembers class net.sourceforge.zbar.ImageScanner { *; }
-keepclassmembers class net.sourceforge.zbar.Image { *; }
-keepclassmembers class net.sourceforge.zbar.Symbol { *; }
-keepclassmembers class net.sourceforge.zbar.SymbolSet { *; }

-keep class com.google.zxing.** {*;}
-dontwarn com.google.zxing.**

##------------ui库 --------------
-keep class com.qmuiteam.qmui.** {*;}
-dontwarn com.qmuiteam.qmui.**
#---------------baseadapter-------------
-keep class com.chad.library.adapter.** {
*;
}
-keep public class * extends com.chad.library.adapter.base.BaseQuickAdapter
-keep public class * extends com.chad.library.adapter.base.BaseViewHolder
-keepclassmembers  class **$** extends com.chad.library.adapter.base.BaseViewHolder {
     <init>(...);
}

#---------------ImmersionBar-------------
-keep class com.gyf.barlibrary.* {*;}

#手动启用support keep注解
#http://tools.android.com/tech-docs/support-annotations
-keep,allowobfuscation @interface android.support.annotation.Keep

-keep @android.support.annotation.Keep class *
-keepclassmembers class * {
    @android.support.annotation.Keep *;
}

# banner 的混淆代码
-keep class com.youth.banner.** {
    *;
}

############### provincePy ###############
-dontwarn net.soureceforge.pinyin4j.**
-dontwarn demo.**
-keep class net.sourceforge.pinyin4j.** { *;}
-keep class demo.** { *;}

#PictureSelector 2.0
-keep class com.luck.picture.lib.** { *; }

-dontwarn com.yalantis.ucrop**
-keep class com.yalantis.ucrop** { *; }
-keep interface com.yalantis.ucrop** { *; }

 #rxjava
-dontwarn sun.misc.**
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
 long producerIndex;
 long consumerIndex;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
 rx.internal.util.atomic.LinkedQueueNode producerNode;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueConsumerNodeRef {
 rx.internal.util.atomic.LinkedQueueNode consumerNode;
}

#rxandroid
-dontwarn sun.misc.**
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
   long producerIndex;
   long consumerIndex;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
    rx.internal.util.atomic.LinkedQueueNode producerNode;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueConsumerNodeRef {
    rx.internal.util.atomic.LinkedQueueNode consumerNode;
}

#glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.AppGlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}
-dontwarn com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool
-dontwarn com.bumptech.glide.load.resource.bitmap.Downsampler
-dontwarn com.bumptech.glide.load.resource.bitmap.HardwareConfigState
-dontwarn com.bumptech.glide.load.resource.bitmap.VideoDecoder
-dontwarn com.bumptech.glide.manager.RequestManagerRetriever

-dontwarn org.springframework.**
#-dontwarn org.androidannotations.api.rest.**
# for DexGuard only
#-keepresourcexmlelements manifest/application/meta-data@value=GlideModule

# Picasso框架混淆设置
-keep public class com.squareup.okhttp.OkUrlFactory
-keep public class com.squareup.okhttp.OkHttpClient
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn okhttp3.internal.platform.ConscryptPlatform
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
-dontwarn com.squareup.picasso.**

################### mob ###################
-keep class com.mob.**{*;}
-keep class cn.smssdk.**{*;}
-dontwarn com.mob.**

################### MPAndroidChart ###################
-keep public class com.github.mikephil.charting.animation.* {
public protected *;
}

################### CalenderView ###################
-keepclasseswithmembers class * {
    public <init>(android.content.Context);
}

################### 高德地图 ###################
##定位
-keep class com.amap.api.location.**{*;}
-keep class com.amap.api.fence.**{*;}
-keep class com.loc.**{*;}
-keep class com.autonavi.aps.amapapi.model.**{*;}

##搜索
-keep class com.amap.api.services.**{*;}

##2D地图
-keep class com.amap.api.maps2d.**{*;}
-keep class com.amap.api.mapcore2d.**{*;}
-dontwarn com.amap.api.maps
-dontwarn com.amap.api.mapcore2d.fk
-dontwarn com.amap.api.mapcore2d.MapMessage

#3D 地图
-keep class com.amap.api.mapcore.**{*;}
-keep class com.amap.api.maps.**{*;}
-keep class com.autonavi.amap.mapcore.*{*;}

################### umeng分享 ###################
-dontusemixedcaseclassnames
-dontshrink
-dontoptimize
-dontwarn com.google.android.maps.**
-dontwarn android.webkit.WebView
-dontwarn com.umeng.**
-dontwarn com.tencent.weibo.sdk.**
-dontwarn com.facebook.**
-keep public class javax.**
-keep public class android.webkit.**
-dontwarn android.support.v4.**
-keep enum com.facebook.**
-keepattributes Exceptions,InnerClasses,Signature
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable

-keep public interface com.facebook.**
-keep public interface com.tencent.**
-keep public interface com.umeng.socialize.**
-keep public interface com.umeng.socialize.sensor.**
-keep public interface com.umeng.scrshot.**
-keep class com.android.dingtalk.share.ddsharemodule.** { *; }
-keep public class com.umeng.socialize.* {*;}


-keep class com.facebook.**
-keep class com.facebook.** { *; }
-keep class com.umeng.scrshot.**
-keep public class com.tencent.** {*;}
-keep class com.umeng.socialize.sensor.**
-keep class com.umeng.socialize.handler.**
-keep class com.umeng.socialize.handler.*
-keep class com.umeng.weixin.handler.**
-keep class com.umeng.weixin.handler.*
-keep class com.umeng.qq.handler.**
-keep class com.umeng.qq.handler.*
-keep class UMMoreHandler{*;}
-keep class com.tencent.mm.sdk.modelmsg.WXMediaMessage {*;}
-keep class com.tencent.mm.sdk.modelmsg.** implements   com.tencent.mm.sdk.modelmsg.WXMediaMessage$IMediaObject {*;}
-keep class im.yixin.sdk.api.YXMessage {*;}
-keep class im.yixin.sdk.api.** implements im.yixin.sdk.api.YXMessage$YXMessageData{*;}
-keep class com.tencent.mm.sdk.** {*;}
-keep class com.tencent.mm.opensdk.** {*;}
-dontwarn twitter4j.**
-keep class twitter4j.** { *; }

-keep class com.tencent.** {*;}
-dontwarn com.tencent.**
-keep public class com.umeng.com.umeng.soexample.R$*{
public static final int *;
}
-keep public class com.linkedin.android.mobilesdk.R$*{
public static final int *;
    }
-keepclassmembers enum * {
public static **[] values();
public static ** valueOf(java.lang.String);
}

-keep class com.tencent.open.TDialog$*
-keep class com.tencent.open.TDialog$* {*;}
-keep class com.tencent.open.PKDialog
-keep class com.tencent.open.PKDialog {*;}
-keep class com.tencent.open.PKDialog$*
-keep class com.tencent.open.PKDialog$* {*;}

-keep class com.sina.** {*;}
-dontwarn com.sina.**
-keep class  com.alipay.share.sdk.** {
   *;
}
-keepnames class * implements android.os.Parcelable {
public static final ** CREATOR;
}

-keep class com.linkedin.** { *; }
-keepattributes Signature

################### wcdb ###################
# Keep all native methods, their classes and any classes in their descriptors
-keep class com.tencent.wcdb.** {*;}
#-keepclasseswithmembers,includedescriptorclasses class com.tencent.wcdb.** {
#    native <methods>;
#}
#
## Keep all exception classes
#-keep class com.tencent.wcdb.**.*Exception
#
## Keep classes referenced in JNI code
#-keep,includedescriptorclasses class com.tencent.wcdb.database.SQLiteCustomFunction { *; }
#-keep class com.tencent.wcdb.database.SQLiteDebug$* { *; }
#-keep class com.tencent.wcdb.database.SQLiteCipherSpec { <fields>; }
#-keep interface com.tencent.wcdb.support.Log$* { *; }
################### 阿里云崩溃分析 ###################

-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

-keep class com.alibaba.ha.**{*;}
-keep class com.taobao.tlog.**{*;}
-keep class com.ut.device.**{*;}
-keep class com.ta.utdid2.device.**{*;}
-keep public class com.alibaba.mtl.** { *;}
-keep public class com.ut.mini.** { *;}
-keep class com.alibaba.motu.crashreporter.**{ *;}
-keep class com.uc.crashsdk.**{*;}
-keep class com.ali.telescope.**{ *;}
-keep class libcore.io.**{*;}
-keep class android.app.**{*;}
-keep class dalvik.system.**{*;}
-keep class com.taobao.tao.log.**{*;}
-keep class com.taobao.android.tlog.**{*;}
-keep class com.alibaba.motu.**{*;}
-keep class com.uc.crashsdk.**{*;}
-dontwarn com.taobao.orange.**
-dontwarn com.taobao.android.**
-dontwarn com.alibaba.ha.adapter.**
-dontwarn com.taobao.monitor.adapter.**
-dontwarn com.alibaba.fastjson.**
-dontwarn com.ali.alihadeviceevaluator.**
-dontwarn java.nio.file.**
-dontwarn org.codehaus.mojo.**
################### 阿里云移动推送 ###################
-keepclasseswithmembernames class ** {
    native <methods>;
}
-keepattributes Signature
-keep class sun.misc.Unsafe { *; }
-keep class com.taobao.** {*;}
-keep class com.alibaba.** {*;}
-keep class com.alipay.** {*;}
-keep class com.ut.** {*;}
-keep class com.ta.** {*;}
-keep class anet.**{*;}
-keep class anetwork.**{*;}
-keep class org.android.spdy.**{*;}
-keep class org.android.agoo.**{*;}
-keep class android.os.**{*;}
-dontwarn com.taobao.**
-dontwarn com.alibaba.**
-dontwarn com.alipay.**
-dontwarn anet.**
-dontwarn org.android.spdy.**
-dontwarn org.android.agoo.**
-dontwarn anetwork.**
-dontwarn com.ut.**
-dontwarn com.ta.**
# 小米通道
-keep class com.xiaomi.** {*;}
-dontwarn com.xiaomi.**
# 华为通道
-keep class com.huawei.** {*;}
-dontwarn com.huawei.**
# GCM/FCM通道
-keep class com.google.firebase.**{*;}
-dontwarn com.google.firebase.**
# OPPO通道（公测）
-keep public class * extends android.app.Service

################### gsyvideoplayer ###################
-keep class com.shuyu.gsyvideoplayer.video.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.video.**
-keep class com.shuyu.gsyvideoplayer.video.base.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.video.base.**
-keep class com.shuyu.gsyvideoplayer.utils.** { *; }
-dontwarn com.shuyu.gsyvideoplayer.utils.**
-keep class tv.danmaku.ijk.** { *; }
-dontwarn tv.danmaku.ijk.**

-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

################### bugly ###################
-dontwarn com.tencent.bugly.**
-keep public class com.tencent.bugly.**{*;}

################### fm 独有 module ###################
-keep class com.facilityone.wireless.a.module.**{*;}
-keep class com.facilityone.wireless.a.arch.ec.module.**{*;}
-keep class com.facilityone.wireless.a.arch.ec.collect.**{*;}
-keep class com.facilityone.wireless.a.arch.offline.**{*;}
-keep class com.facilityone.wireless.demand.module.**{*;}
-keep class com.facilityone.wireless.workorder.module.**{*;}
-keep class com.facilityone.wireless.patrol.module.**{*;}
-keep class com.facilityone.wireless.sign.module.**{*;}
-keep class com.facilityone.wireless.visitor.module.**{*;}
-keep class com.facilityone.wireless.asset.model.**{*;}
-keep class com.facilityone.wireless.bulletin.model.**{*;}
-keep class com.facilityone.wireless.chart.module.**{*;}
-keep class com.facilityone.wireless.contract.module.**{*;}
-keep class com.facilityone.wireless.energy.module.**{*;}
-keep class com.facilityone.wireless.payment.module.**{*;}
-keep class com.facilityone.wireless.inventory.model.**{*;}
-keep class com.facilityone.wireless.maintenance.model.**{*;}
-keep class com.facilityone.wireless.monitor.module.**{*;}
-keep class com.facilityone.wireless.knowledge.module.**{*;}
-keep class com.facilityone.wireless.inspection.module.**{*;}
-keep class com.facilityone.wireless.basiclib.module.**{*;}
-keep class com.facilityone.wireless.person.module.**{*;}
-keep class com.fm.tool.network.model.**{*;}
-keep class com.facilityone.wireless.ensure.model.**{*;}
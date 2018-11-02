Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC6EECDE46
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40FA120685
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=demfloro.ru header.i=@demfloro.ru header.b="QUy3K5NS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40FA120685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=demfloro.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad92ab8d;
	Sun, 4 Nov 2018 17:07:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 373319da
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 08:36:13 +0000 (UTC)
Received: from mx.demfloro.ru (mx.demfloro.ru [185.52.0.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dfce0d0
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 08:36:13 +0000 (UTC)
Received: from note (unknown [94.140.192.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: demfloro)
 by mx.demfloro.ru (Postfix) with ESMTPSA id 42mb9Y05K4z5vJ7;
 Fri,  2 Nov 2018 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=demfloro.ru; s=052018; 
 t=1541148002;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LcJXiOCVtipbvjpXqsIHdDAoz3ZSdn6XUAMuvH/N7o=;
 b=QUy3K5NS6c2ThCn5fnR44pFMgOxxanFwsVgMS8a3Ko+L5v099CMBSGZrNKkDpPDs0POMYr
 EcieVEjS9b3BZK9lWEvWVplv7WshCsJx7QByshBiTJGRsiKlARAa2VpIt+eDvm57MG1msf
 PfwXZ5htQrbQSOpwLLo+Oa9HyrLoRqMVxV40cLCNf0oFatGWzd8dIv7fvzjXQxBWjzgtWG
 YN+x7fRICGxU131jamqAAoVsTn6JJvPulaEe5ggkVs0fVkvGvhl/vPr1sNMsVanXD6JIiu
 g90ERuWdAH/gy3e84BSB9Cypzet8Q/t1p5wBNTfkgqkE2Wl+w5OEvoUaHWtX9g==
Date: Fri, 2 Nov 2018 11:39:52 +0300
From: Dmitrii Tcvetkov <demfloro@demfloro.ru>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Subject: Re: F Droid build 0.0.20181031 broken
Message-ID: <20181102113952.7af2e414@note>
In-Reply-To: <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
References: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
 <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/2F9ns+G0o9TVvdOjxWrMytN"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=demfloro.ru;
 s=arc052018; t=1541148002;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LcJXiOCVtipbvjpXqsIHdDAoz3ZSdn6XUAMuvH/N7o=;
 b=xBXc9mXExU4rFNFTtJZXWUD4abZrBproT87kSAmJdtSjRyMUzn/qT/cHRNU538V8VZRlCl
 YDsVHODI9Uqt0BkaiuSG58Up9oCD1MTAI6I5mSbizeh5FW1wFjZoM2+DWdPCAP2frHKhtw
 8cuBf3dgZM8xgRE5qAfe0Ov1sau41AkSKppjO8r90QYbHsoaePkovt9OVelS5nzgEdRZH4
 Ay6lvKaT88P38szHURb82r3p0VL87bMK6gIZuz5NEtFFN5JuwDgUAoF/LhGZ+m8RKjg9Iw
 0fPwzPZ4yOarkPYXqGjoZ9hJW/3INrWG6TMeg53lC22DeS9u2QoRElCQH0215w==
ARC-Seal: i=1; s=arc052018; d=demfloro.ru; t=1541148002; a=rsa-sha256; cv=none;
 b=IQhsmXdNHPTCKH1dRjNG/PyB1LjKvmC6n+8uMVom2CCyS/XfQB0nkTnp87Gds1BLY6sk8ayF5T13tW/7n7T8Lt9C7TUt5GKlP9oxVwSD7L0HWDHZgOOSk4IMyDl+at/5uGDxX7nN6uopqCVzbWDRvKEaRvBGJYcGzsOUvJ8uiNzc6GR3aslDyIyIwLq6h4aM2wSQBsK0f0Ki2QN8FUDzSYzI5fJfUHqxzH6yPJrPdpM2Xiod5OWLduIA3bHu6rGu+jxVNFkrdfFYABq7TgzGYt2GEbijFQss4FUk/kznFt5uHsNDf8Ay3w5eM4X8lMvxXvpKvwHqPRwH0HQ34bA72A==
ARC-Authentication-Results: i=1; mx.demfloro.ru;
 auth=pass smtp.auth=demfloro smtp.mailfrom=demfloro@demfloro.ru
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:07:23 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--MP_/2F9ns+G0o9TVvdOjxWrMytN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, 2 Nov 2018 08:39:28 +0100
Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ
> <laszlo.kertesz@gmail.com> wrote:
> > The current FDroid build (version 0.0.20181031) is broken. The Gui
> > starts but it states "Unknown userspace Go version" and the tunnel
> > activation action results in an error. 
> Hmm... just installed (1st time) and started it, seems fine (haven't
> configured it yet).
> What is your configuration?
> 
> Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on
> XT1905 phone.
> 
> Kalin.

I got the problem too after the WireGuard update. Error is: 
 No implementation found for java.lang.String
 com.wireguard.android.backend.GoBackend.wgVersion()

LineageOS 15.1-20181030 (Android 8.1.0), without Google Play Services,
Device Xiaomi Mi A1.

Full log attached. 

--MP_/2F9ns+G0o9TVvdOjxWrMytN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=wireguard-log.txt

--------- beginning of main
11-02 08:20:25.250  3993  4298 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Sending handshake initiation
11-02 08:20:25.254  3993  4298 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Awaiting keypair
11-02 08:20:25.321  3993  6027 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Received handshake response
11-02 08:20:25.321  3993  6027 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Obtained awaited keypair
--------- beginning of events
11-02 08:21:47.810  3993  3993 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,LAUNCH_ACTIVITY]
11-02 08:21:47.820  3993 11619 D OpenGLRenderer: HWUI GL Pipeline
11-02 08:21:47.875  3993 11619 I Adreno  : QUALCOMM build                  =
 : 2371bd1, I8ebe47d372
11-02 08:21:47.875  3993 11619 I Adreno  : Build Date                      =
 : 03/12/18
11-02 08:21:47.875  3993 11619 I Adreno  : OpenGL ES Shader Compiler Versio=
n: EV031.22.00.01
11-02 08:21:47.875  3993 11619 I Adreno  : Local Branch                    =
 :=20
11-02 08:21:47.875  3993 11619 I Adreno  : Remote Branch                   =
 : quic/gfx-adreno.lnx.1.0.r36-rel
11-02 08:21:47.875  3993 11619 I Adreno  : Remote Branch                   =
 : NONE
11-02 08:21:47.875  3993 11619 I Adreno  : Reconstruct Branch              =
 : NOTHING
11-02 08:21:47.876  3993 11619 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:21:47.886  3993 11619 I Adreno  : PFP: 0x005ff087, ME: 0x005ff063
11-02 08:21:47.899  3993 11619 I zygote64: android::hardware::configstore::=
V1_0::ISurfaceFlingerConfigs::hasWideColorDisplay retrieved: 0
11-02 08:21:47.901  3993 11619 I OpenGLRenderer: Initialized EGL, version 1=
.4
11-02 08:21:47.901  3993 11619 D OpenGLRenderer: Swap behavior 2
11-02 08:21:47.967  3993 11619 D vndksupport: Loading /vendor/lib64/hw/andr=
oid.hardware.graphics.mapper@2.0-impl.so from current namespace instead of =
sphal namespace.
11-02 08:21:47.968  3993 11619 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:21:48.993  3993 11628 D WireGuard/GoBackend: Changing tunnel vpn t=
o state DOWN
11-02 08:21:48.993  3993 11628 I WireGuard/GoBackend: Bringing tunnel down
11-02 08:21:48.995  3993 11628 I WireGuard/GoBackend/vpn: Device closing
11-02 08:21:48.995  3993  4091 D WireGuard/GoBackend/vpn: Routine: receive =
incoming IPv4 - stopped
11-02 08:21:48.995  3993 11567 D WireGuard/GoBackend/vpn: Routine: event wo=
rker - stopped
11-02 08:21:48.995  3993 11567 D WireGuard/GoBackend/vpn: Routine: receive =
incoming IPv6 - stopped
11-02 08:21:48.996  3993  4091 D WireGuard/GoBackend/vpn: Routine: encrypti=
on worker - stopped
11-02 08:21:48.996  3993  4091 D WireGuard/GoBackend/vpn: Routine: encrypti=
on worker - stopped
11-02 08:21:48.996  3993  4091 D WireGuard/GoBackend/vpn: Routine: decrypti=
on worker - stopped
11-02 08:21:48.996  3993  4091 D WireGuard/GoBackend/vpn: Routine: decrypti=
on worker - stopped
11-02 08:21:48.996  3993  4091 D WireGuard/GoBackend/vpn: Routine: handshak=
e worker - stopped
11-02 08:21:48.996  3993  4091 D WireGuard/GoBackend/vpn: Routine: handshak=
e worker - stopped
11-02 08:21:49.081  3993  4745 D WireGuard/GoBackend/vpn: Routine: TUN read=
er - stopped
11-02 08:21:49.082  3993 11628 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Stopping...
11-02 08:21:49.082  3993 11567 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Routine: sequential sender - stopped
11-02 08:21:49.082  3993 11567 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Routine: nonce worker - stopped
11-02 08:21:49.082  3993 11567 D WireGuard/GoBackend/vpn: peer(dI5L=E2=80=
=A6mcUE) - Routine: sequential receiver - stopped
11-02 08:21:49.082  3993 11628 I WireGuard/GoBackend/vpn: Interface closed
11-02 08:21:49.876  3993  3993 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:21:49.921  3993  3993 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:21:52.463 11662 11662 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
--------- beginning of system
11-02 08:21:52.489 11662 11662 I ActivityThread: handleStopService: token=
=3Dandroid.os.BinderProxy@ef5c9f6 not found.
11-02 08:21:59.552 11804 11804 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
11-02 08:21:59.599 11804 11804 D WireGuard/GoBackend: Service started by Al=
ways-on VPN feature
11-02 08:21:59.631 11804 11804 D WireGuard/ExceptionLoggers: Future complet=
ed successfully
11-02 08:21:59.635 11804 11858 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:22:06.768 11804 11804 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,LAUNCH_ACTIVITY]
11-02 08:22:06.777 11804 11874 D OpenGLRenderer: HWUI GL Pipeline
11-02 08:22:06.822 11804 11874 I Adreno  : QUALCOMM build                  =
 : 2371bd1, I8ebe47d372
11-02 08:22:06.822 11804 11874 I Adreno  : Build Date                      =
 : 03/12/18
11-02 08:22:06.822 11804 11874 I Adreno  : OpenGL ES Shader Compiler Versio=
n: EV031.22.00.01
11-02 08:22:06.822 11804 11874 I Adreno  : Local Branch                    =
 :=20
11-02 08:22:06.822 11804 11874 I Adreno  : Remote Branch                   =
 : quic/gfx-adreno.lnx.1.0.r36-rel
11-02 08:22:06.822 11804 11874 I Adreno  : Remote Branch                   =
 : NONE
11-02 08:22:06.822 11804 11874 I Adreno  : Reconstruct Branch              =
 : NOTHING
11-02 08:22:06.824 11804 11874 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:22:06.833 11804 11874 I Adreno  : PFP: 0x005ff087, ME: 0x005ff063
11-02 08:22:06.842 11804 11874 I zygote64: android::hardware::configstore::=
V1_0::ISurfaceFlingerConfigs::hasWideColorDisplay retrieved: 0
11-02 08:22:06.843 11804 11874 I OpenGLRenderer: Initialized EGL, version 1=
.4
11-02 08:22:06.843 11804 11874 D OpenGLRenderer: Swap behavior 2
11-02 08:22:06.916 11804 11874 D vndksupport: Loading /vendor/lib64/hw/andr=
oid.hardware.graphics.mapper@2.0-impl.so from current namespace instead of =
sphal namespace.
11-02 08:22:06.918 11804 11874 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:22:08.372 11804 11852 D WireGuard/GoBackend: Changing tunnel vpn t=
o state UP
11-02 08:22:08.372 11804 11852 I WireGuard/GoBackend: Bringing tunnel up
11-02 08:22:08.406 11804 11852 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: Error bringing up =
tunnel: No implementation found for java.lang.String com.wireguard.android.=
backend.GoBackend.wgVersion() (tried Java_com_wireguard_android_backend_GoB=
ackend_wgVersion and Java_com_wireguard_android_backend_GoBackend_wgVersion=
__)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: java9.util.concurr=
ent.CompletionException: java.lang.UnsatisfiedLinkError: No implementation =
found for java.lang.String com.wireguard.android.backend.GoBackend.wgVersio=
n() (tried Java_com_wireguard_android_backend_GoBackend_wgVersion and Java_=
com_wireguard_android_backend_GoBackend_wgVersion__)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.encodeRelay(CompletableFuture.java:357)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeRelay(CompletableFuture.java:367)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture$UniRelay.tryFire(CompletableFuture.java:1009)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.postComplete(CompletableFuture.java:504)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeExceptionally(CompletableFuture.java:2079)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$null$4(AsyncWorker.java:48)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$0jVCYNboBOWw9K-jArH8OB3SmXI.run(Unknown =
Source:4)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at android.os.Han=
dler.handleCallback(Handler.java:790)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at android.os.Han=
dler.dispatchMessage(Handler.java:99)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at android.os.Loo=
per.loop(Looper.java:164)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at android.app.Ac=
tivityThread.main(ActivityThread.java:6494)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java.lang.refl=
ect.Method.invoke(Native Method)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:440)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.ZygoteInit.main(ZygoteInit.java:807)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: Caused by: java.la=
ng.UnsatisfiedLinkError: No implementation found for java.lang.String com.w=
ireguard.android.backend.GoBackend.wgVersion() (tried Java_com_wireguard_an=
droid_backend_GoBackend_wgVersion and Java_com_wireguard_android_backend_Go=
Backend_wgVersion__)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.wgVersion(Native Method)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setStateInternal(GoBackend.java:200)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setState(GoBackend.java:114)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.TunnelManager.lambda$null$18(TunnelManager.java:249)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.-$$Lambda$TunnelManager$fAapFPNRxx6EfgD7SEnbhcfuzuM.get(Unkno=
wn Source:4)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.java:45)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bfA18.run(Unknown =
Source:6)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at android.os.Asy=
ncTask$SerialExecutor$1.run(AsyncTask.java:245)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1162)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:636)
11-02 08:22:08.516 11804 11804 E WireGuard/BaseFragment: 	at java.lang.Thre=
ad.run(Thread.java:764)
11-02 08:22:08.527 11804 11804 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:22:08.528 11804 11804 I chatty  : uid=3D10105(com.wireguard.androi=
d) identical 5 lines
11-02 08:22:08.529 11804 11804 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:22:08.530 11804 11804 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:22:12.235 11804 11854 D WireGuard/GoBackend: Changing tunnel vpn t=
o state UP
11-02 08:22:12.236 11804 11854 I WireGuard/GoBackend: Bringing tunnel up
11-02 08:22:12.273 11804 11854 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: Error bringing up =
tunnel: No implementation found for java.lang.String com.wireguard.android.=
backend.GoBackend.wgVersion() (tried Java_com_wireguard_android_backend_GoB=
ackend_wgVersion and Java_com_wireguard_android_backend_GoBackend_wgVersion=
__)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: java9.util.concurr=
ent.CompletionException: java.lang.UnsatisfiedLinkError: No implementation =
found for java.lang.String com.wireguard.android.backend.GoBackend.wgVersio=
n() (tried Java_com_wireguard_android_backend_GoBackend_wgVersion and Java_=
com_wireguard_android_backend_GoBackend_wgVersion__)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.encodeRelay(CompletableFuture.java:357)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeRelay(CompletableFuture.java:367)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture$UniRelay.tryFire(CompletableFuture.java:1009)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.postComplete(CompletableFuture.java:504)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeExceptionally(CompletableFuture.java:2079)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$null$4(AsyncWorker.java:48)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$0jVCYNboBOWw9K-jArH8OB3SmXI.run(Unknown =
Source:4)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at android.os.Han=
dler.handleCallback(Handler.java:790)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at android.os.Han=
dler.dispatchMessage(Handler.java:99)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at android.os.Loo=
per.loop(Looper.java:164)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at android.app.Ac=
tivityThread.main(ActivityThread.java:6494)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java.lang.refl=
ect.Method.invoke(Native Method)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:440)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.ZygoteInit.main(ZygoteInit.java:807)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: Caused by: java.la=
ng.UnsatisfiedLinkError: No implementation found for java.lang.String com.w=
ireguard.android.backend.GoBackend.wgVersion() (tried Java_com_wireguard_an=
droid_backend_GoBackend_wgVersion and Java_com_wireguard_android_backend_Go=
Backend_wgVersion__)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.wgVersion(Native Method)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setStateInternal(GoBackend.java:200)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setState(GoBackend.java:114)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.TunnelManager.lambda$null$18(TunnelManager.java:249)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.-$$Lambda$TunnelManager$fAapFPNRxx6EfgD7SEnbhcfuzuM.get(Unkno=
wn Source:4)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.java:45)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bfA18.run(Unknown =
Source:6)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at android.os.Asy=
ncTask$SerialExecutor$1.run(AsyncTask.java:245)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1162)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:636)
11-02 08:22:12.358 11804 11804 E WireGuard/BaseFragment: 	at java.lang.Thre=
ad.run(Thread.java:764)
11-02 08:22:12.364 11804 11804 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:22:12.367 11804 11804 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:22:12.443 11804 11813 I zygote64: Do partial code cache collection=
, code=3D29KB, data=3D24KB
11-02 08:22:12.443 11804 11813 I zygote64: After code cache collection, cod=
e=3D28KB, data=3D24KB
11-02 08:22:12.443 11804 11813 I zygote64: Increasing code cache capacity t=
o 128KB
11-02 08:22:14.568 11804 11804 I menu_item_selected: [0,Settings]
11-02 08:22:14.581 11804 11804 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:22:14.630 11804 11858 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:22:14.657 11804 11804 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,LAUNCH_ACTIVITY]
11-02 08:22:14.953 11804 11804 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:22:18.369 11804 11804 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,handlePauseActivity]
11-02 08:22:18.386 11804 11804 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,RESUME_ACTIVITY]
11-02 08:22:18.472 11804 11804 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.SettingsActivity,destroy]
11-02 08:22:19.649 11804 11804 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:22:19.701 11804 11804 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:22:24.953 11910 11910 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
11-02 08:22:25.003 11910 11910 D WireGuard/GoBackend: Service started by Al=
ways-on VPN feature
11-02 08:22:25.053 11910 11910 D WireGuard/ExceptionLoggers: Future complet=
ed successfully
11-02 08:22:25.066 11910 11933 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:22:29.861 11910 11925 I zygote64: Waiting for a blocking GC Profil=
eSaver
11-02 08:23:25.931 12119 12119 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
11-02 08:23:25.971 12119 12119 D WireGuard/GoBackend: Service started by Al=
ways-on VPN feature
11-02 08:23:25.999 12119 12119 D WireGuard/ExceptionLoggers: Future complet=
ed successfully
11-02 08:23:26.001 12119 12145 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:23:30.847 12119 12137 I zygote64: Waiting for a blocking GC Profil=
eSaver
11-02 08:23:33.988 12119 12119 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,LAUNCH_ACTIVITY]
11-02 08:23:33.997 12119 12178 D OpenGLRenderer: HWUI GL Pipeline
11-02 08:23:34.051 12119 12178 I Adreno  : QUALCOMM build                  =
 : 2371bd1, I8ebe47d372
11-02 08:23:34.051 12119 12178 I Adreno  : Build Date                      =
 : 03/12/18
11-02 08:23:34.051 12119 12178 I Adreno  : OpenGL ES Shader Compiler Versio=
n: EV031.22.00.01
11-02 08:23:34.051 12119 12178 I Adreno  : Local Branch                    =
 :=20
11-02 08:23:34.051 12119 12178 I Adreno  : Remote Branch                   =
 : quic/gfx-adreno.lnx.1.0.r36-rel
11-02 08:23:34.051 12119 12178 I Adreno  : Remote Branch                   =
 : NONE
11-02 08:23:34.051 12119 12178 I Adreno  : Reconstruct Branch              =
 : NOTHING
11-02 08:23:34.052 12119 12178 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:23:34.061 12119 12178 I Adreno  : PFP: 0x005ff087, ME: 0x005ff063
11-02 08:23:34.072 12119 12178 I zygote64: android::hardware::configstore::=
V1_0::ISurfaceFlingerConfigs::hasWideColorDisplay retrieved: 0
11-02 08:23:34.092 12119 12178 I OpenGLRenderer: Initialized EGL, version 1=
.4
11-02 08:23:34.093 12119 12178 D OpenGLRenderer: Swap behavior 2
11-02 08:23:34.168 12119 12178 D vndksupport: Loading /vendor/lib64/hw/andr=
oid.hardware.graphics.mapper@2.0-impl.so from current namespace instead of =
sphal namespace.
11-02 08:23:34.169 12119 12178 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:23:35.037 12119 12142 D WireGuard/GoBackend: Changing tunnel vpn t=
o state UP
11-02 08:23:35.037 12119 12142 I WireGuard/GoBackend: Bringing tunnel up
11-02 08:23:35.064 12119 12142 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: Error bringing up =
tunnel: No implementation found for java.lang.String com.wireguard.android.=
backend.GoBackend.wgVersion() (tried Java_com_wireguard_android_backend_GoB=
ackend_wgVersion and Java_com_wireguard_android_backend_GoBackend_wgVersion=
__)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: java9.util.concurr=
ent.CompletionException: java.lang.UnsatisfiedLinkError: No implementation =
found for java.lang.String com.wireguard.android.backend.GoBackend.wgVersio=
n() (tried Java_com_wireguard_android_backend_GoBackend_wgVersion and Java_=
com_wireguard_android_backend_GoBackend_wgVersion__)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.encodeRelay(CompletableFuture.java:357)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeRelay(CompletableFuture.java:367)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture$UniRelay.tryFire(CompletableFuture.java:1009)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.postComplete(CompletableFuture.java:504)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeExceptionally(CompletableFuture.java:2079)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$null$4(AsyncWorker.java:48)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$0jVCYNboBOWw9K-jArH8OB3SmXI.run(Unknown =
Source:4)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at android.os.Han=
dler.handleCallback(Handler.java:790)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at android.os.Han=
dler.dispatchMessage(Handler.java:99)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at android.os.Loo=
per.loop(Looper.java:164)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at android.app.Ac=
tivityThread.main(ActivityThread.java:6494)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java.lang.refl=
ect.Method.invoke(Native Method)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:440)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.ZygoteInit.main(ZygoteInit.java:807)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: Caused by: java.la=
ng.UnsatisfiedLinkError: No implementation found for java.lang.String com.w=
ireguard.android.backend.GoBackend.wgVersion() (tried Java_com_wireguard_an=
droid_backend_GoBackend_wgVersion and Java_com_wireguard_android_backend_Go=
Backend_wgVersion__)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.wgVersion(Native Method)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setStateInternal(GoBackend.java:200)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setState(GoBackend.java:114)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.TunnelManager.lambda$null$18(TunnelManager.java:249)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.-$$Lambda$TunnelManager$fAapFPNRxx6EfgD7SEnbhcfuzuM.get(Unkno=
wn Source:4)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.java:45)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bfA18.run(Unknown =
Source:6)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at android.os.Asy=
ncTask$SerialExecutor$1.run(AsyncTask.java:245)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1162)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:636)
11-02 08:23:35.159 12119 12119 E WireGuard/BaseFragment: 	at java.lang.Thre=
ad.run(Thread.java:764)
11-02 08:23:35.176 12119 12119 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:23:35.177 12119 12119 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:23:35.177 12119 12119 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:23:35.179 12119 12119 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:23:35.179 12119 12119 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:23:39.417 12119 12127 I zygote64: Do partial code cache collection=
, code=3D29KB, data=3D23KB
11-02 08:23:39.417 12119 12127 I zygote64: After code cache collection, cod=
e=3D28KB, data=3D23KB
11-02 08:23:39.417 12119 12127 I zygote64: Increasing code cache capacity t=
o 128KB
11-02 08:23:41.380 12119 12119 I menu_item_selected: [0,Settings]
11-02 08:23:41.395 12119 12119 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:23:41.436 12119 12144 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:23:41.466 12119 12119 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,LAUNCH_ACTIVITY]
11-02 08:23:41.665 12119 12119 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:23:42.286 12119 12119 I zygote64: Deoptimizing void android.suppor=
t.v4.widget.ViewGroupUtils.offsetDescendantMatrix(android.view.ViewParent, =
android.view.View, android.graphics.Matrix) due to JIT inline cache
11-02 08:23:48.143 12119 12119 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,handlePauseActivity]
11-02 08:23:48.160 12119 12119 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,RESUME_ACTIVITY]
11-02 08:23:48.250 12119 12119 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.SettingsActivity,destroy]
11-02 08:23:49.426 12119 12119 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:23:49.475 12119 12119 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:23:51.755 12212 12212 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
11-02 08:23:51.807 12212 12212 D WireGuard/GoBackend: Service started by Al=
ways-on VPN feature
11-02 08:23:51.836 12212 12212 D WireGuard/ExceptionLoggers: Future complet=
ed successfully
11-02 08:23:51.849 12212 12244 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:23:56.665 12212 12229 I zygote64: Waiting for a blocking GC Profil=
eSaver
11-02 08:24:49.488 12369 12369 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
11-02 08:24:49.726 12369 12369 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,LAUNCH_ACTIVITY]
11-02 08:24:49.736 12369 12399 D OpenGLRenderer: HWUI GL Pipeline
11-02 08:24:49.758 12369 12402 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:24:49.796 12369 12399 I Adreno  : QUALCOMM build                  =
 : 2371bd1, I8ebe47d372
11-02 08:24:49.796 12369 12399 I Adreno  : Build Date                      =
 : 03/12/18
11-02 08:24:49.796 12369 12399 I Adreno  : OpenGL ES Shader Compiler Versio=
n: EV031.22.00.01
11-02 08:24:49.796 12369 12399 I Adreno  : Local Branch                    =
 :=20
11-02 08:24:49.796 12369 12399 I Adreno  : Remote Branch                   =
 : quic/gfx-adreno.lnx.1.0.r36-rel
11-02 08:24:49.796 12369 12399 I Adreno  : Remote Branch                   =
 : NONE
11-02 08:24:49.796 12369 12399 I Adreno  : Reconstruct Branch              =
 : NOTHING
11-02 08:24:49.797 12369 12399 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:24:49.805 12369 12399 I Adreno  : PFP: 0x005ff087, ME: 0x005ff063
11-02 08:24:49.816 12369 12399 I zygote64: android::hardware::configstore::=
V1_0::ISurfaceFlingerConfigs::hasWideColorDisplay retrieved: 0
11-02 08:24:49.818 12369 12399 I OpenGLRenderer: Initialized EGL, version 1=
.4
11-02 08:24:49.818 12369 12399 D OpenGLRenderer: Swap behavior 2
11-02 08:24:49.893 12369 12399 D vndksupport: Loading /vendor/lib64/hw/andr=
oid.hardware.graphics.mapper@2.0-impl.so from current namespace instead of =
sphal namespace.
11-02 08:24:49.894 12369 12399 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:24:51.380 12369 12369 I menu_item_selected: [0,Settings]
11-02 08:24:51.390 12369 12369 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:24:51.428 12369 12387 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:24:51.454 12369 12369 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,LAUNCH_ACTIVITY]
11-02 08:24:51.648 12369 12369 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:24:56.484 12369 12369 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,handlePauseActivity]
11-02 08:24:56.495 12369 12369 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,RESUME_ACTIVITY]
11-02 08:24:56.571 12369 12369 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.SettingsActivity,destroy]
11-02 08:24:57.515 12369 12374 I zygote64: Do partial code cache collection=
, code=3D28KB, data=3D30KB
11-02 08:24:57.515 12369 12374 I zygote64: After code cache collection, cod=
e=3D27KB, data=3D29KB
11-02 08:24:57.515 12369 12374 I zygote64: Increasing code cache capacity t=
o 128KB
11-02 08:24:57.516 12369 12391 D WireGuard/GoBackend: Changing tunnel vpn t=
o state UP
11-02 08:24:57.516 12369 12391 I WireGuard/GoBackend: Bringing tunnel up
11-02 08:24:57.518 12369 12391 D WireGuard/GoBackend: Requesting to start V=
pnService
11-02 08:24:57.545 12369 12391 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: Error bringing up =
tunnel: No implementation found for java.lang.String com.wireguard.android.=
backend.GoBackend.wgVersion() (tried Java_com_wireguard_android_backend_GoB=
ackend_wgVersion and Java_com_wireguard_android_backend_GoBackend_wgVersion=
__)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: java9.util.concurr=
ent.CompletionException: java.lang.UnsatisfiedLinkError: No implementation =
found for java.lang.String com.wireguard.android.backend.GoBackend.wgVersio=
n() (tried Java_com_wireguard_android_backend_GoBackend_wgVersion and Java_=
com_wireguard_android_backend_GoBackend_wgVersion__)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.encodeRelay(CompletableFuture.java:357)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeRelay(CompletableFuture.java:367)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture$UniRelay.tryFire(CompletableFuture.java:1009)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.postComplete(CompletableFuture.java:504)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeExceptionally(CompletableFuture.java:2079)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$null$4(AsyncWorker.java:48)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$0jVCYNboBOWw9K-jArH8OB3SmXI.run(Unknown =
Source:4)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at android.os.Han=
dler.handleCallback(Handler.java:790)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at android.os.Han=
dler.dispatchMessage(Handler.java:99)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at android.os.Loo=
per.loop(Looper.java:164)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at android.app.Ac=
tivityThread.main(ActivityThread.java:6494)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java.lang.refl=
ect.Method.invoke(Native Method)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:440)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.ZygoteInit.main(ZygoteInit.java:807)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: Caused by: java.la=
ng.UnsatisfiedLinkError: No implementation found for java.lang.String com.w=
ireguard.android.backend.GoBackend.wgVersion() (tried Java_com_wireguard_an=
droid_backend_GoBackend_wgVersion and Java_com_wireguard_android_backend_Go=
Backend_wgVersion__)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.wgVersion(Native Method)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setStateInternal(GoBackend.java:200)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setState(GoBackend.java:114)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.TunnelManager.lambda$null$18(TunnelManager.java:249)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.-$$Lambda$TunnelManager$fAapFPNRxx6EfgD7SEnbhcfuzuM.get(Unkno=
wn Source:4)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.java:45)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bfA18.run(Unknown =
Source:6)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at android.os.Asy=
ncTask$SerialExecutor$1.run(AsyncTask.java:245)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1162)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:636)
11-02 08:24:57.648 12369 12369 E WireGuard/BaseFragment: 	at java.lang.Thre=
ad.run(Thread.java:764)
11-02 08:24:57.666 12369 12369 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:24:57.667 12369 12369 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:24:57.667 12369 12369 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:24:57.669 12369 12369 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:24:57.669 12369 12369 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:24:58.827 12369 12369 I menu_item_selected: [0,Settings]
11-02 08:24:58.840 12369 12369 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:24:58.871 12369 12402 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:24:58.893 12369 12369 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,LAUNCH_ACTIVITY]
11-02 08:24:59.037 12369 12369 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:24:59.076 12369 12374 I zygote64: Do partial code cache collection=
, code=3D56KB, data=3D51KB
11-02 08:24:59.076 12369 12374 I zygote64: After code cache collection, cod=
e=3D56KB, data=3D51KB
11-02 08:24:59.076 12369 12374 I zygote64: Increasing code cache capacity t=
o 256KB
11-02 08:25:00.546 12369 12369 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,handlePauseActivity]
11-02 08:25:02.226 12369 12369 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,RESUME_ACTIVITY]
11-02 08:25:08.110 12369 12369 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,handlePauseActivity]
11-02 08:25:08.123 12369 12369 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,RESUME_ACTIVITY]
11-02 08:25:08.219 12369 12369 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.SettingsActivity,destroy]
11-02 08:25:09.466 12369 12369 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:25:09.522 12369 12369 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:25:11.820 12445 12445 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
11-02 08:25:11.867 12445 12445 I ActivityThread: handleStopService: token=
=3Dandroid.os.BinderProxy@ef5c9f6 not found.
11-02 08:25:11.946 12445 12468 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:25:16.728 12445 12460 I zygote64: Waiting for a blocking GC Profil=
eSaver
11-02 08:25:16.741 12445 12460 I zygote64: WaitForGcToComplete blocked Prof=
ileSaver on HeapTrim for 12.762ms
11-02 08:31:47.687 12445 12445 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,LAUNCH_ACTIVITY]
11-02 08:31:47.697 12445 13208 D OpenGLRenderer: HWUI GL Pipeline
11-02 08:31:47.745 12445 13208 I Adreno  : QUALCOMM build                  =
 : 2371bd1, I8ebe47d372
11-02 08:31:47.745 12445 13208 I Adreno  : Build Date                      =
 : 03/12/18
11-02 08:31:47.745 12445 13208 I Adreno  : OpenGL ES Shader Compiler Versio=
n: EV031.22.00.01
11-02 08:31:47.745 12445 13208 I Adreno  : Local Branch                    =
 :=20
11-02 08:31:47.745 12445 13208 I Adreno  : Remote Branch                   =
 : quic/gfx-adreno.lnx.1.0.r36-rel
11-02 08:31:47.745 12445 13208 I Adreno  : Remote Branch                   =
 : NONE
11-02 08:31:47.745 12445 13208 I Adreno  : Reconstruct Branch              =
 : NOTHING
11-02 08:31:47.746 12445 13208 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:31:47.761 12445 13208 I Adreno  : PFP: 0x005ff087, ME: 0x005ff063
11-02 08:31:47.770 12445 13208 I zygote64: android::hardware::configstore::=
V1_0::ISurfaceFlingerConfigs::hasWideColorDisplay retrieved: 0
11-02 08:31:47.773 12445 13208 I OpenGLRenderer: Initialized EGL, version 1=
.4
11-02 08:31:47.774 12445 13208 D OpenGLRenderer: Swap behavior 2
11-02 08:31:47.844 12445 13208 D vndksupport: Loading /vendor/lib64/hw/andr=
oid.hardware.graphics.mapper@2.0-impl.so from current namespace instead of =
sphal namespace.
11-02 08:31:47.846 12445 13208 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 08:31:48.479 12445 13213 D WireGuard/GoBackend: Changing tunnel vpn t=
o state UP
11-02 08:31:48.479 12445 13213 I WireGuard/GoBackend: Bringing tunnel up
11-02 08:31:48.481 12445 13213 D WireGuard/GoBackend: Requesting to start V=
pnService
11-02 08:31:48.510 12445 13213 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: Error bringing up =
tunnel: No implementation found for java.lang.String com.wireguard.android.=
backend.GoBackend.wgVersion() (tried Java_com_wireguard_android_backend_GoB=
ackend_wgVersion and Java_com_wireguard_android_backend_GoBackend_wgVersion=
__)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: java9.util.concurr=
ent.CompletionException: java.lang.UnsatisfiedLinkError: No implementation =
found for java.lang.String com.wireguard.android.backend.GoBackend.wgVersio=
n() (tried Java_com_wireguard_android_backend_GoBackend_wgVersion and Java_=
com_wireguard_android_backend_GoBackend_wgVersion__)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.encodeRelay(CompletableFuture.java:357)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeRelay(CompletableFuture.java:367)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture$UniRelay.tryFire(CompletableFuture.java:1009)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.postComplete(CompletableFuture.java:504)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeExceptionally(CompletableFuture.java:2079)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$null$4(AsyncWorker.java:48)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$0jVCYNboBOWw9K-jArH8OB3SmXI.run(Unknown =
Source:4)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at android.os.Han=
dler.handleCallback(Handler.java:790)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at android.os.Han=
dler.dispatchMessage(Handler.java:99)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at android.os.Loo=
per.loop(Looper.java:164)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at android.app.Ac=
tivityThread.main(ActivityThread.java:6494)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java.lang.refl=
ect.Method.invoke(Native Method)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:440)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.ZygoteInit.main(ZygoteInit.java:807)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: Caused by: java.la=
ng.UnsatisfiedLinkError: No implementation found for java.lang.String com.w=
ireguard.android.backend.GoBackend.wgVersion() (tried Java_com_wireguard_an=
droid_backend_GoBackend_wgVersion and Java_com_wireguard_android_backend_Go=
Backend_wgVersion__)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.wgVersion(Native Method)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setStateInternal(GoBackend.java:200)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setState(GoBackend.java:114)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.TunnelManager.lambda$null$18(TunnelManager.java:249)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.-$$Lambda$TunnelManager$fAapFPNRxx6EfgD7SEnbhcfuzuM.get(Unkno=
wn Source:4)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.java:45)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bfA18.run(Unknown =
Source:6)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at android.os.Asy=
ncTask$SerialExecutor$1.run(AsyncTask.java:245)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1162)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:636)
11-02 08:31:48.607 12445 12445 E WireGuard/BaseFragment: 	at java.lang.Thre=
ad.run(Thread.java:764)
11-02 08:31:48.620 12445 12445 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:31:48.623 12445 12445 I chatty  : uid=3D10105(com.wireguard.androi=
d) identical 3 lines
11-02 08:31:48.624 12445 12445 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 08:31:53.118 12445 12445 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 08:31:53.171 12445 12445 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 08:31:55.682 13227 13227 I ACRA    : ACRA is enabled for com.wireguar=
d.android, initializing...
11-02 08:31:55.726 13227 13227 I ActivityThread: handleStopService: token=
=3Dandroid.os.BinderProxy@ef5c9f6 not found.
11-02 08:31:55.765 13227 13253 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 11:29:03.556 13227 13227 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,LAUNCH_ACTIVITY]
11-02 11:29:03.564 13227 16906 D OpenGLRenderer: HWUI GL Pipeline
11-02 11:29:03.616 13227 16906 I Adreno  : QUALCOMM build                  =
 : 2371bd1, I8ebe47d372
11-02 11:29:03.616 13227 16906 I Adreno  : Build Date                      =
 : 03/12/18
11-02 11:29:03.616 13227 16906 I Adreno  : OpenGL ES Shader Compiler Versio=
n: EV031.22.00.01
11-02 11:29:03.616 13227 16906 I Adreno  : Local Branch                    =
 :=20
11-02 11:29:03.616 13227 16906 I Adreno  : Remote Branch                   =
 : quic/gfx-adreno.lnx.1.0.r36-rel
11-02 11:29:03.616 13227 16906 I Adreno  : Remote Branch                   =
 : NONE
11-02 11:29:03.616 13227 16906 I Adreno  : Reconstruct Branch              =
 : NOTHING
11-02 11:29:03.618 13227 16906 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 11:29:03.632 13227 16906 I Adreno  : PFP: 0x005ff087, ME: 0x005ff063
11-02 11:29:03.644 13227 16906 I zygote64: android::hardware::configstore::=
V1_0::ISurfaceFlingerConfigs::hasWideColorDisplay retrieved: 0
11-02 11:29:03.646 13227 16906 I OpenGLRenderer: Initialized EGL, version 1=
.4
11-02 11:29:03.646 13227 16906 D OpenGLRenderer: Swap behavior 2
11-02 11:29:03.722 13227 16906 D vndksupport: Loading /vendor/lib64/hw/andr=
oid.hardware.graphics.mapper@2.0-impl.so from current namespace instead of =
sphal namespace.
11-02 11:29:03.723 13227 16906 D vndksupport: Loading /vendor/lib64/hw/gral=
loc.msm8953.so from current namespace instead of sphal namespace.
11-02 11:29:05.140 13227 13227 I menu_item_selected: [0,Settings]
11-02 11:29:05.151 13227 13227 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 11:29:05.187 13227 16919 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 11:29:05.216 13227 13227 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,LAUNCH_ACTIVITY]
11-02 11:29:05.399 13227 13227 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 11:29:07.953 13227 13227 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,handlePauseActivity]
11-02 11:29:07.969 13227 13227 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.MainActivity,RESUME_ACTIVITY]
11-02 11:29:08.056 13227 13227 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.SettingsActivity,destroy]
11-02 11:29:09.182 13227 16923 D WireGuard/GoBackend: Changing tunnel vpn t=
o state UP
11-02 11:29:09.183 13227 16923 I WireGuard/GoBackend: Bringing tunnel up
11-02 11:29:09.185 13227 16923 D WireGuard/GoBackend: Requesting to start V=
pnService
11-02 11:29:09.212 13227 16923 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: Error bringing up =
tunnel: No implementation found for java.lang.String com.wireguard.android.=
backend.GoBackend.wgVersion() (tried Java_com_wireguard_android_backend_GoB=
ackend_wgVersion and Java_com_wireguard_android_backend_GoBackend_wgVersion=
__)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: java9.util.concurr=
ent.CompletionException: java.lang.UnsatisfiedLinkError: No implementation =
found for java.lang.String com.wireguard.android.backend.GoBackend.wgVersio=
n() (tried Java_com_wireguard_android_backend_GoBackend_wgVersion and Java_=
com_wireguard_android_backend_GoBackend_wgVersion__)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.encodeRelay(CompletableFuture.java:357)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeRelay(CompletableFuture.java:367)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture$UniRelay.tryFire(CompletableFuture.java:1009)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.postComplete(CompletableFuture.java:504)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java9.util.con=
current.CompletableFuture.completeExceptionally(CompletableFuture.java:2079)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$null$4(AsyncWorker.java:48)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$0jVCYNboBOWw9K-jArH8OB3SmXI.run(Unknown =
Source:4)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at android.os.Han=
dler.handleCallback(Handler.java:790)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at android.os.Han=
dler.dispatchMessage(Handler.java:99)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at android.os.Loo=
per.loop(Looper.java:164)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at android.app.Ac=
tivityThread.main(ActivityThread.java:6494)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java.lang.refl=
ect.Method.invoke(Native Method)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:440)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.android.in=
ternal.os.ZygoteInit.main(ZygoteInit.java:807)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: Caused by: java.la=
ng.UnsatisfiedLinkError: No implementation found for java.lang.String com.w=
ireguard.android.backend.GoBackend.wgVersion() (tried Java_com_wireguard_an=
droid_backend_GoBackend_wgVersion and Java_com_wireguard_android_backend_Go=
Backend_wgVersion__)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.wgVersion(Native Method)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setStateInternal(GoBackend.java:200)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.backend.GoBackend.setState(GoBackend.java:114)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.TunnelManager.lambda$null$18(TunnelManager.java:249)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.model.-$$Lambda$TunnelManager$fAapFPNRxx6EfgD7SEnbhcfuzuM.get(Unkno=
wn Source:4)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.java:45)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at com.wireguard.=
android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bfA18.run(Unknown =
Source:6)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at android.os.Asy=
ncTask$SerialExecutor$1.run(AsyncTask.java:245)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1162)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java.util.conc=
urrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:636)
11-02 11:29:09.315 13227 13227 E WireGuard/BaseFragment: 	at java.lang.Thre=
ad.run(Thread.java:764)
11-02 11:29:09.327 13227 13227 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 11:29:09.328 13227 13227 I chatty  : uid=3D10105(com.wireguard.androi=
d) identical 1 line
11-02 11:29:09.328 13227 13227 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 11:29:09.330 13227 13227 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 11:29:09.330 13227 13227 W StaticLayout: maxLineHeight should not be =
-1.  maxLines:2 lineCount:2
11-02 11:29:10.714 13227 13227 I menu_item_selected: [0,Settings]
11-02 11:29:10.730 13227 13227 I am_on_paused_called: [0,com.wireguard.andr=
oid.activity.MainActivity,handlePauseActivity]
11-02 11:29:10.762 13227 16941 E zygote64: No implementation found for java=
.lang.String com.wireguard.android.backend.GoBackend.wgVersion() (tried Jav=
a_com_wireguard_android_backend_GoBackend_wgVersion and Java_com_wireguard_=
android_backend_GoBackend_wgVersion__)
11-02 11:29:10.786 13227 13227 I am_on_resume_called: [0,com.wireguard.andr=
oid.activity.SettingsActivity,LAUNCH_ACTIVITY]
11-02 11:29:10.791 13227 13232 I zygote64: Do partial code cache collection=
, code=3D30KB, data=3D27KB
11-02 11:29:10.791 13227 13232 I zygote64: After code cache collection, cod=
e=3D28KB, data=3D27KB
11-02 11:29:10.791 13227 13232 I zygote64: Increasing code cache capacity t=
o 128KB
11-02 11:29:10.949 13227 13227 I am_on_stop_called: [0,com.wireguard.androi=
d.activity.MainActivity,handleStopActivity]
11-02 11:29:10.979 13227 13232 I zygote64: Do partial code cache collection=
, code=3D52KB, data=3D42KB
11-02 11:29:10.980 13227 13232 I zygote64: After code cache collection, cod=
e=3D52KB, data=3D42KB
11-02 11:29:10.980 13227 13232 I zygote64: Increasing code cache capacity t=
o 256KB

--MP_/2F9ns+G0o9TVvdOjxWrMytN
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--MP_/2F9ns+G0o9TVvdOjxWrMytN--

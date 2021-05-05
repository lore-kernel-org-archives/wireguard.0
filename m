Return-Path: <SRS0=k5hk=KA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139D0C43460
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 May 2021 10:36:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A484361222
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 May 2021 10:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A484361222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=adslweb.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1da446c9;
	Wed, 5 May 2021 10:35:32 +0000 (UTC)
Received: from p3plwbeout27-04.prod.phx3.secureserver.net
 (p3plsmtp27-04-2.prod.phx3.secureserver.net [216.69.139.52])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b740544b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 May 2021 07:47:29 +0000 (UTC)
Received: from elara.servers.prgn.misp.co.uk ([91.146.105.202])
 by :WBEOUT: with ESMTP
 id eCFilDWtchRrreCFjlhftQ; Wed, 05 May 2021 00:47:27 -0700
X-CMAE-Analysis: v=2.4 cv=Z7MpoFdA c=1 sm=1 tr=0 ts=60924d8f
 a=WDPPBMsengTuW/7aDIN5nw==:117 a=WDPPBMsengTuW/7aDIN5nw==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=nZngercmKh8A:10 a=IkcTkHD0fZMA:10
 a=5FLXtPjwQuUA:10 a=M3nSiEFUT-lVYY0bk-kA:9 a=QEXdDO2ut3YA:10
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-SECURESERVER-ACCT: peter@themad-house.co.uk
X-SID: eCFilDWtchRrr
Received: from localhost ([127.0.0.1]:34228 helo=elara.servers.prgn.misp.co.uk)
 by elara.servers.prgn.misp.co.uk with esmtpa (Exim 4.94.2)
 (envelope-from <tomt@adslweb.co.uk>) id 1leCFi-0007eY-8m
 for wireguard@lists.zx2c4.com; Wed, 05 May 2021 08:47:26 +0100
MIME-Version: 1.0
Date: Wed, 05 May 2021 08:47:26 +0100
From: tomt@adslweb.co.uk
To: wireguard@lists.zx2c4.com
Subject: Android Client Won't Disconnect Tunnel
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f4166ec7d77fa22bdd727edafe9c58ad@adslweb.co.uk>
X-Sender: tomt@adslweb.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - elara.servers.prgn.misp.co.uk
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - adslweb.co.uk
X-Get-Message-Sender-Via: elara.servers.prgn.misp.co.uk: authenticated_id:
 peter@themad-house.co.uk
X-Authenticated-Sender: elara.servers.prgn.misp.co.uk: peter@themad-house.co.uk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-TSO-Authenticated: peter@themad-house.co.uk
X-Originating-IP: 127.0.0.1
X-CMAE-Envelope: MS4xfPBgdLkE+Kk3GLH/i4j7vggtkUUGzbqj6wfOI0kv/wnw9czYTvNZIWS0zredqSPrXjuae43EY6dYBUm3+cRBUr7XHcblfmuh7JyhcCDc0NdmJXKXcXWE
 pFosbias8DdmPnWg1Rxv+C33/APfR3wBcqoh+oPZZdUwJO1OroXRsGvsyDmGPySaB7JJBYm5Y1JQk9Kgyc6idDAORracPB8p1Ve2t71pmGIr81pclAFwFRAE
X-Mailman-Approved-At: Wed, 05 May 2021 10:35:28 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
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

Hi,

I've installed WireGuard for Android v1.0.20210211 ( Go userspace 
backend v0.0.20201118 ) on to my Huawei P30 running Android 10 and my 
Lenovo Tab4 8Plus running Lineage OS Android 10

Both clients can connect to my OPNsense firewall via WireGuard and 
traffic routes as expected. OPNsense shows the connection in List 
Configuration and Handshake. When the VPN is active the 'key' is shown 
in the status bar and all is working fine.

When I disable the client using the slider the 'key' disappears from the 
statue bar, but OPNsense still shows the connection as active and data 
can still route from the phone or tablet via the VPN, even though I've 
disabled it.

If I check the client log, they both contain entries similar to the 
following:

05-05 08:32:08.180 31602 31629 I WireGuard/GoBackend: Bringing tunnel 
RemoteAccesss DOWN
05-05 08:32:08.181 31602 31629 D WireGuard/GoBackend/RemoteAccesss: 
Device closing
05-05 08:32:08.182 31602 32422 D WireGuard/GoBackend/RemoteAccesss: 
Routine: event worker - stopped
05-05 08:32:08.186 31602 31602 E WireGuard/ObservableTunnel: 
java.lang.NullPointerException: Attempt to invoke virtual method 
'java.lang.String[] java.lang.String.split(java.lang.String)' on a null 
object reference
05-05 08:32:08.186 31602 31602 E WireGuard/ObservableTunnel: 	at 
com.wireguard.android.backend.GoBackend.getStatistics(GoBackend.java:4)
05-05 08:32:08.186 31602 31602 E WireGuard/ObservableTunnel: 	at 
com.wireguard.android.model.TunnelManager$getTunnelStatistics$2$1.invokeSuspend(TunnelManager.kt:5)
05-05 08:32:08.186 31602 31602 E WireGuard/ObservableTunnel: 	at 
kotlin.coroutines.jvm.internal.BaseContinuationImpl.resumeWith(ContinuationImpl.kt:3)
05-05 08:32:08.186 31602 31602 E WireGuard/ObservableTunnel: 	at 
kotlinx.coroutines.DispatchedTask.run(DispatchedTask.kt:15)
05-05 08:32:08.186 31602 31602 E WireGuard/ObservableTunnel: 	at 
kotlinx.coroutines.scheduling.CoroutineScheduler.runSafely(CoroutineScheduler.kt:1)
05-05 08:32:08.186 31602 31602 E WireGuard/ObservableTunnel: 	at 
kotlinx.coroutines.scheduling.CoroutineScheduler$Worker.run(CoroutineScheduler.kt:11)
05-05 08:32:08.227 31602 32198 D WireGuard/GoBackend/RemoteAccesss: 
Routine: TUN reader - stopped
05-05 08:32:08.228 31602 32198 D WireGuard/GoBackend/RemoteAccesss: 
Routine: receive incoming IPv4 - stopped
05-05 08:32:08.228 31602 32199 D WireGuard/GoBackend/RemoteAccesss: 
Routine: receive incoming IPv6 - stopped
05-05 08:32:08.228 31602 31629 D WireGuard/GoBackend/RemoteAccesss: 
peer(MqVe…+q28) - Stopping...
05-05 08:32:08.228 31602 32198 D WireGuard/GoBackend/RemoteAccesss: 
peer(MqVe…+q28) - Routine: sequential receiver - stopped
05-05 08:32:08.229 31602 32198 D WireGuard/GoBackend/RemoteAccesss: 
peer(MqVe…+q28) - Routine: sequential sender - stopped
05-05 08:32:08.229 31602 31629 D WireGuard/GoBackend/RemoteAccesss: 
Device closed
05-05 08:32:08.229 31602 32422 D WireGuard/GoBackend/RemoteAccesss: 
Routine: decryption worker - stopped

Would that affect the disconnecting of the tunnel ?
Has anyone had this issue with the client not actually disconnecting ?
Any way to get this resolved ?

Thanks

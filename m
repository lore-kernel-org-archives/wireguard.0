Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7281C10F00
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:35:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52552222A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mercier.uno header.i=@mercier.uno header.b="NK04qQYq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52552222A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mercier.uno
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9498ba64;
	Sun, 17 Feb 2019 01:27:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4097d3de
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Feb 2019 16:44:19 +0000 (UTC)
Received: from n1nlsmtp02.shr.prod.ams1.secureserver.net
 (n1nlsmtp02.prod.ams1.secureserver.net [188.121.43.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 114ed524
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Feb 2019 16:44:19 +0000 (UTC)
Received: from n1plcpnl0101.prod.ams1.secureserver.net ([188.121.57.37])
 by : HOSTING RELAY : with ESMTP
 id v3BXgWAG43vHCv3BXgGEYm; Sat, 16 Feb 2019 09:51:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mercier.uno
 ; s=default;
 h=Message-Id:In-Reply-To:To:References:Date:Subject:Mime-Version
 :Content-Type:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WpdOH43805xOKOiOvKVO4pDqSl7K9aT+Oak30K0TXLc=; b=NK04qQYq+xyJUDe5vvotWfmIcQ
 ZflLj6M9Pxate+/KczWXxMx4+INU5c4se5VmUPhRZ5Q0VWZWx9qqaJbKM1AiNdhso9Qr2ogb9+q9c
 UCw28IzTZLenvmqKFZKbIbxtipE8OUutCk9wBneSwULamKtWoBpx4JnrUeBYEg+K6XC1qlilDtMQV
 2xKmnOTq6l21IdL2CDxeaVLCx+XwW5+TBhDUmFtrMgt/RNmWg6UjPVO2/SoDZqbODOhENEfo9u+6i
 h2SD7gPIpYa8SNbOqrsiKZSW3g5p5maPkMnvPjovsv0vNQspl1amdbETUmWaRc+qQDZAY+BlT+1g3
 1VxikaDg==;
Received: from adsl-140-194.myt.mu ([41.212.140.194]:63820
 helo=hhkm-hy-lbd.lan)
 by n1plcpnl0101.prod.ams1.secureserver.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
 (envelope-from <vincent@mercier.uno>) id 1gv3BX-00DHGH-A7
 for wireguard@lists.zx2c4.com; Sat, 16 Feb 2019 09:51:27 -0700
From: Vincent <vincent@mercier.uno>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Subject: WireGuard for macOS
Date: Sat, 16 Feb 2019 20:51:17 +0400
References: <mailman.3.1550314802.25721.wireguard@lists.zx2c4.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <mailman.3.1550314802.25721.wireguard@lists.zx2c4.com>
Message-Id: <61B2DFA7-71B6-43A4-99F8-EFB537A4BA44@mercier.uno>
X-Mailer: Apple Mail (2.3445.9.1)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - n1plcpnl0101.prod.ams1.secureserver.net
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - mercier.uno
X-Get-Message-Sender-Via: n1plcpnl0101.prod.ams1.secureserver.net: authenticated_id:
 vincent@mercier.uno
X-Authenticated-Sender: n1plcpnl0101.prod.ams1.secureserver.net: vincent@mercier.uno
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4wfI1lyIxFyH6xIyEjBoDaqM2IGhp1L1lKtAfZAjLxRR7ANAtvMANhteODrrw0Run02u8fE473fjobq3h4Sd0qCb/i1blmJ6plaWujzYcv/maItJrwMb7M
 Cxg4M7BeFmX3n+ctP5OV8+ieVQYlE3WK1PgVdoM5qNsbq2XBaN5y7C4VYVFK3vcbfXqPmrlZ9kr2s8FvyKDtoKU3cjB2H2fiwOk=
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:27:11 +0100
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
Content-Type: multipart/mixed; boundary="===============8407868896344670199=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8407868896344670199==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CFBE608B-A57B-40A5-9C79-73A46A79B0DB"


--Apple-Mail=_CFBE608B-A57B-40A5-9C79-73A46A79B0DB
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Thank you Jason for the Mac version.
Can we mac users get also a previous OS version support?
10.13.

Thank you


> On 16 Feb 2019, at 15:00, wireguard-request@lists.zx2c4.com wrote:
> 
> Send WireGuard mailing list submissions to
> 	wireguard@lists.zx2c4.com
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.zx2c4.com/mailman/listinfo/wireguard
> or, via email, send a message with subject or body 'help' to
> 	wireguard-request@lists.zx2c4.com
> 
> You can reach the person managing the list at
> 	wireguard-owner@lists.zx2c4.com
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of WireGuard digest..."
> 
> 
> Today's Topics:
> 
>   1. WireGuard for macOS (Jason A. Donenfeld)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Sat, 16 Feb 2019 02:26:20 +0100
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> To: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Subject: WireGuard for macOS
> Message-ID:
> 	<CAHmME9qjTJbWYVr9cToXpfnshGkppcqVS5=iVzqsrjS+v_aF+w@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
> 
> Hey everyone,
> 
> After many months of hard work, Roopesh, Eric, and I are pleased to
> announce an initial version of WireGuard for macOS:
> 
> https://itunes.apple.com/us/app/wireguard/id1451685025?ls=1&mt=12
> 
> This is built from the same code base as our existing iOS app and
> makes use of Apple's Network Extension API to provide native
> integration into the operating system's networking stack. The
> application lives in the status bar, and after importing a
> configuration, the ordinary System Preferences networking item may
> also be used to control each tunnel. Because it uses these deep
> integration APIs, we're only allowed to distribute the application
> using the macOS App Store (whose rejections, appeals, and eventual
> acceptance made for quite the stressful saga over the last week and a
> half). Compared to the current CLI integration, we expect the
> WireGuard experience using this app to be excellent.
> 
> For curious folks without a Mac (or without the patience to cajole KVM
> into booting macOS), I've assembled a few screenshots:
> https://data.zx2c4.com/wireguard-for-macos-screenshots-february-2019/
> 
> This is new software, and there will certainly be problems. Don't
> hesitate to email team@wireguard.com directly with bugs as you
> encounter them.
> 
> Enjoy!
> 
> Regards,
> Jason
> 
> PS: Because people will inevitably ask: yes, a Windows client is on
> its way, and it will have a very similar interface to this macOS one.
> We're taking the long and careful route, writing a new TUN driver for
> Windows 7+ called "Wintun" that we expect to be safer and faster than
> the current popular OpenVPN TUN driver, and also suitable for all
> projects, not just for WireGuard. We already have packets flowing and
> things generally work well, but polish will require a bit of patience.
> If you'd like to help and have an appetite for NDIS drivers, Win32 GUI
> programming, or Go, please do get in touch.
> 
> 
> ------------------------------
> 
> Subject: Digest Footer
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
> 
> ------------------------------
> 
> End of WireGuard Digest, Vol 35, Issue 4
> ****************************************


--Apple-Mail=_CFBE608B-A57B-40A5-9C79-73A46A79B0DB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div class=3D""><font face=3D"Lucida Grande, Verdana, Arial, =
sans-serif" size=3D"1" class=3D""><b class=3D"">Thank you Jason for the =
Mac version.</b></font></div><div class=3D""><font face=3D"Lucida =
Grande, Verdana, Arial, sans-serif" size=3D"1" class=3D""><b =
class=3D"">Can we mac users get also a previous OS version =
support?</b></font></div><div class=3D""><font face=3D"Lucida Grande, =
Verdana, Arial, sans-serif" size=3D"1" class=3D""><b =
class=3D"">10.13.</b></font></div><div class=3D""><font face=3D"Lucida =
Grande, Verdana, Arial, sans-serif" size=3D"1" class=3D""><b =
class=3D""><br class=3D""></b></font></div><div class=3D""><font =
face=3D"Lucida Grande, Verdana, Arial, sans-serif" size=3D"1" =
class=3D""><b class=3D"">Thank you</b></font></div><div class=3D""><font =
face=3D"Lucida Grande, Verdana, Arial, sans-serif" size=3D"1" =
class=3D""><b class=3D""><br class=3D""></b></font></div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 16 Feb 2019, at 15:00, <a =
href=3D"mailto:wireguard-request@lists.zx2c4.com" =
class=3D"">wireguard-request@lists.zx2c4.com</a> wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Send =
WireGuard mailing list submissions to<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><a =
href=3D"mailto:wireguard@lists.zx2c4.com" =
class=3D"">wireguard@lists.zx2c4.com</a><br class=3D""><br class=3D"">To =
subscribe or unsubscribe via the World Wide Web, visit<br class=3D""><span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D"">or, via email, send a message with subject or body 'help' =
to<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>wireguard-request@lists.zx2c4.com<br class=3D""><br =
class=3D"">You can reach the person managing the list at<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>wireguard-owner@lists.zx2c4.com<br class=3D""><br class=3D"">When =
replying, please edit your Subject line so it is more specific<br =
class=3D"">than "Re: Contents of WireGuard digest..."<br class=3D""><br =
class=3D""><br class=3D"">Today's Topics:<br class=3D""><br class=3D""> =
&nbsp;&nbsp;1. WireGuard for macOS (Jason A. Donenfeld)<br class=3D""><br =
class=3D""><br =
class=3D"">---------------------------------------------------------------=
-------<br class=3D""><br class=3D"">Message: 1<br class=3D"">Date: Sat, =
16 Feb 2019 02:26:20 +0100<br class=3D"">From: "Jason A. Donenfeld" =
&lt;Jason@zx2c4.com&gt;<br class=3D"">To: WireGuard mailing list =
&lt;wireguard@lists.zx2c4.com&gt;<br class=3D"">Subject: WireGuard for =
macOS<br class=3D"">Message-ID:<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&lt;CAHmME9qjTJbWYVr9cToXpfnshGkppcqVS5=3DiVzqsrjS+v_aF+w@mail.gmai=
l.com&gt;<br class=3D"">Content-Type: text/plain; charset=3D"UTF-8"<br =
class=3D""><br class=3D"">Hey everyone,<br class=3D""><br class=3D"">After=
 many months of hard work, Roopesh, Eric, and I are pleased to<br =
class=3D"">announce an initial version of WireGuard for macOS:<br =
class=3D""><br =
class=3D"">https://itunes.apple.com/us/app/wireguard/id1451685025?ls=3D1&a=
mp;mt=3D12<br class=3D""><br class=3D"">This is built from the same code =
base as our existing iOS app and<br class=3D"">makes use of Apple's =
Network Extension API to provide native<br class=3D"">integration into =
the operating system's networking stack. The<br class=3D"">application =
lives in the status bar, and after importing a<br =
class=3D"">configuration, the ordinary System Preferences networking =
item may<br class=3D"">also be used to control each tunnel. Because it =
uses these deep<br class=3D"">integration APIs, we're only allowed to =
distribute the application<br class=3D"">using the macOS App Store =
(whose rejections, appeals, and eventual<br class=3D"">acceptance made =
for quite the stressful saga over the last week and a<br class=3D"">half).=
 Compared to the current CLI integration, we expect the<br =
class=3D"">WireGuard experience using this app to be excellent.<br =
class=3D""><br class=3D"">For curious folks without a Mac (or without =
the patience to cajole KVM<br class=3D"">into booting macOS), I've =
assembled a few screenshots:<br =
class=3D"">https://data.zx2c4.com/wireguard-for-macos-screenshots-february=
-2019/<br class=3D""><br class=3D"">This is new software, and there will =
certainly be problems. Don't<br class=3D"">hesitate to email =
team@wireguard.com directly with bugs as you<br class=3D"">encounter =
them.<br class=3D""><br class=3D"">Enjoy!<br class=3D""><br =
class=3D"">Regards,<br class=3D"">Jason<br class=3D""><br class=3D"">PS: =
Because people will inevitably ask: yes, a Windows client is on<br =
class=3D"">its way, and it will have a very similar interface to this =
macOS one.<br class=3D"">We're taking the long and careful route, =
writing a new TUN driver for<br class=3D"">Windows 7+ called "Wintun" =
that we expect to be safer and faster than<br class=3D"">the current =
popular OpenVPN TUN driver, and also suitable for all<br =
class=3D"">projects, not just for WireGuard. We already have packets =
flowing and<br class=3D"">things generally work well, but polish will =
require a bit of patience.<br class=3D"">If you'd like to help and have =
an appetite for NDIS drivers, Win32 GUI<br class=3D"">programming, or =
Go, please do get in touch.<br class=3D""><br class=3D""><br =
class=3D"">------------------------------<br class=3D""><br =
class=3D"">Subject: Digest Footer<br class=3D""><br =
class=3D"">_______________________________________________<br =
class=3D"">WireGuard mailing list<br =
class=3D"">WireGuard@lists.zx2c4.com<br =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D""><br class=3D""><br class=3D"">------------------------------<br=
 class=3D""><br class=3D"">End of WireGuard Digest, Vol 35, Issue 4<br =
class=3D"">****************************************<br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_CFBE608B-A57B-40A5-9C79-73A46A79B0DB--

--===============8407868896344670199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8407868896344670199==--

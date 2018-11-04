Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A251C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:21:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B462081B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTD7xpfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B462081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21aa7f62;
	Sun, 4 Nov 2018 17:17:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ae14951
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:14:42 +0000 (UTC)
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da73e07d
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:14:42 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id e126so3783895vsc.9
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 09:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Xj1K7fgFeKW8/afyu8eZju/NavJgsqTEAntt2rQHEE=;
 b=OTD7xpfgzRKjk8IPj+hY0/neJinPwb1YSEItNN5gCsUT63RBkM7KBTH1KsWCULx5N0
 ESywFWY1yRatpp22F0ZCFxusU1XnV51hxrj4xbd9MDPXt3LN5p45fb+1sNLt3uB01zZI
 6Lh6CuAzTVnC00UF83iK0eNIZ2GZmHRt8rBYy+KelyHtlV8VoJP2KzcT+EuFNwT7fA0u
 JdynlJ5YG3QaNXzhSXon9yoQ5ao0u/V5UVsNO6J1BJqPeCcSL/CtaEcxVWQ8KXKP+gU1
 uiO8bWSq0Xm6CszUkMf/CntMI7Nll7XMISEP/C+NAKs775S4x22C5RNdDDHXbGdUWJa2
 R4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Xj1K7fgFeKW8/afyu8eZju/NavJgsqTEAntt2rQHEE=;
 b=M+OZ+DNL/COxNaqUHYOtbM75Wn35ksKaSQDwSCdZqiQiuUzrcZYCGaXHtJ/MhEF0Ly
 D56M2OLXCzfo62gSHLXQjnsG8+dYP3Sb85PolESMTK5pgfFngfbb8eeSCnI9uXZmrN6D
 HaReR3z5cUBa9lcrq44ho155AZEToNavVzLcNyj5soazr8El5YMcHyZhuxxSW2g7DmXW
 llqausI0UaRqQfD8JZlutod0RvgUIPuksHA6GyAIsQOpw+TsdWM9neKt8h5+yoto7JKn
 VfKjWBl4V9iOZaAmEyTanXD5aB1hDPUKcGp3oW6Ku2TjZa2sJJwr8jVnbQ/FEvxCYFZo
 raIA==
X-Gm-Message-State: AGRZ1gJTkB7l60EN6ZoRhiET/WwthWxXclDZ/jT3hfF3mU8CiMiCM4WZ
 uqJhm2BKrbW1X0KoNZbzO/hOhqLg3TOti62HWwd3Eg==
X-Google-Smtp-Source: AJdET5d7tuCxussA30yNFm4MKUXHmDpSsHgBZUtj2BfMVjorvFq5VzfeWttmvP/V6zpUzd4u+ANh/4CXz3kRfdc6BAE=
X-Received: by 2002:a67:d59d:: with SMTP id m29mr7901047vsj.139.1541351928483; 
 Sun, 04 Nov 2018 09:18:48 -0800 (PST)
MIME-Version: 1.0
References: <CAD6UttB+_G4RY-TwyJ7w6rX-wKqqRqds0B9hMVvFPfjNHvwtgg@mail.gmail.com>
In-Reply-To: <CAD6UttB+_G4RY-TwyJ7w6rX-wKqqRqds0B9hMVvFPfjNHvwtgg@mail.gmail.com>
From: Tushar Pankaj <tushar.s.pankaj@gmail.com>
Date: Sun, 4 Nov 2018 11:18:37 -0600
Message-ID: <CANO=1yKaU=8wkaSZffR7qb3EQwHUcUWbPb6-2zLQ0YZoAkpjFQ@mail.gmail.com>
Subject: Re: Google Play can't Download through Kernel module backend
To: Love4Taylor <love4taylor.me@gmail.com>
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:17:02 +0100
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============3790972895873314889=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3790972895873314889==
Content-Type: multipart/alternative; boundary="0000000000002bd4970579d9f6e7"

--0000000000002bd4970579d9f6e7
Content-Type: text/plain; charset="UTF-8"

I've had this issue too, which I reported to Jason. It seems that when I'm
connected via the kernel module, HTTPS has issues (but nothing else). When
I'm connected via the Go backend, this isn't the case.

Thanks,
Tushar Pankaj

On Sun, Nov 4, 2018, 11:16 Love4Taylor <love4taylor.me@gmail.com wrote:

> Hi,
> I recently discovered that when I use the Kernel module backend,
> Google Play will always be stuck in Downloading, I got the following
> logcat, but everything works fine when using Go module backend
> (Android VPN).
>
> D DownloadManager: [558] Starting
> W DownloadManager: [514] Stop requested with status HTTP_DATA_ERROR:
> SSL handshake aborted: ssl=0x766f2a4008: I/O error during system call,
> Connection reset by peer
> D DownloadManager: [514] Finished with status WAITING_TO_RETR
>
> D DownloadManager: [558] Starting
> W DownloadManager: [555] Stop requested with status HTTP_DATA_ERROR:
> failed to connect to r1---sn-3qqp-ioqsl.gvt1.com/27.85.180.172 (port
> 443) from /10.0.0.101 (port 49253) after 20000ms
> D DownloadManager: [555] Finished with status HTTP_DATA_ERROR
>
> I think it should not be a server problem, even if I use the free
> server provided by TunSafe, it is the same problem. It seems that the
> DownloadManager called by Google Play has not passed Wireguard at
> all(10.0.0.101 is my LAN IP). Then I did the following test.
> Kernel module backend + Router blocks Google domain name: Google Play
> stuck in Downloading, the log is the same as above.
> Go module backend + Router blocks Google domain name: Everything works
> fine, no error log.
> Kernel module backend + Router does not block Google domain name:
> Everything works fine, no error log.
>
> My Phones: OG Pixel/Nexus6 (Both are Android 9)
> The link is route etc. on my phone: http://ix.io/1n8q
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000002bd4970579d9f6e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;ve had this issue too, which I reported to Jas=
on. It seems that when I&#39;m connected via the kernel module, HTTPS has i=
ssues (but nothing else). When I&#39;m connected via the Go backend, this i=
sn&#39;t the case.<br><br><div data-smartmail=3D"gmail_signature">Thanks,<b=
r>Tushar Pankaj</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun=
, Nov 4, 2018, 11:16 Love4Taylor &lt;<a href=3D"mailto:love4taylor.me@gmail=
.com">love4taylor.me@gmail.com</a> wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hi,<br>
I recently discovered that when I use the Kernel module backend,<br>
Google Play will always be stuck in Downloading, I got the following<br>
logcat, but everything works fine when using Go module backend<br>
(Android VPN).<br>
<br>
D DownloadManager: [558] Starting<br>
W DownloadManager: [514] Stop requested with status HTTP_DATA_ERROR:<br>
SSL handshake aborted: ssl=3D0x766f2a4008: I/O error during system call,<br=
>
Connection reset by peer<br>
D DownloadManager: [514] Finished with status WAITING_TO_RETR<br>
<br>
D DownloadManager: [558] Starting<br>
W DownloadManager: [555] Stop requested with status HTTP_DATA_ERROR:<br>
failed to connect to <a href=3D"http://r1---sn-3qqp-ioqsl.gvt1.com/27.85.18=
0.172" rel=3D"noreferrer noreferrer" target=3D"_blank">r1---sn-3qqp-ioqsl.g=
vt1.com/27.85.180.172</a> (port<br>
443) from /<a href=3D"http://10.0.0.101" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">10.0.0.101</a> (port 49253) after 20000ms<br>
D DownloadManager: [555] Finished with status HTTP_DATA_ERROR<br>
<br>
I think it should not be a server problem, even if I use the free<br>
server provided by TunSafe, it is the same problem. It seems that the<br>
DownloadManager called by Google Play has not passed Wireguard at<br>
all(10.0.0.101 is my LAN IP). Then I did the following test.<br>
Kernel module backend + Router blocks Google domain name: Google Play<br>
stuck in Downloading, the log is the same as above.<br>
Go module backend + Router blocks Google domain name: Everything works<br>
fine, no error log.<br>
Kernel module backend + Router does not block Google domain name:<br>
Everything works fine, no error log.<br>
<br>
My Phones: OG Pixel/Nexus6 (Both are Android 9)<br>
The link is route etc. on my phone: <a href=3D"http://ix.io/1n8q" rel=3D"no=
referrer noreferrer" target=3D"_blank">http://ix.io/1n8q</a><br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--0000000000002bd4970579d9f6e7--

--===============3790972895873314889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3790972895873314889==--

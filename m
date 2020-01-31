Return-Path: <SRS0=RHSj=33=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B97C352A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3E020726
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK8ncKb2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3E020726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38dcfcec;
	Fri, 7 Feb 2020 11:20:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b633c65
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jan 2020 01:59:41 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 011c271e
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jan 2020 01:59:41 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q84so5783968oic.4
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jan 2020 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=S2PfYFM25RtDD3RFR08xC0BE75t8FSiCe3809FqtOi0=;
 b=dK8ncKb2aM7FtmC89Cc6+t4s27qkRuY8gn7F6I6ArzxOwNjXobu3Rgp/nmHvvOzzAc
 EcLeAq81/4jeIwtNPdh3Gj6SpSSIF+R2VlYUWjhrGF4PbdyftC24PEmptkGp9VokMi7W
 A3xchp9x7+ZwW7fsCXLFikfA3M37H8fjGChoLC/N1HpagP98tPou7WboXIZw7ZiEklZ3
 E5VnYbM15zqiNAI9X2qOks8ib8zKAKZ4i7o8orngcXEuBK1d7qKVrFTRUZkAQLgEYVca
 VHleCZzU5LJEoBvh35mDRWuS2Z+skAU6OqRtoocM4G6JumxP9y6BnnfmdEAU1n9UJDcc
 j1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=S2PfYFM25RtDD3RFR08xC0BE75t8FSiCe3809FqtOi0=;
 b=Kioo+4q0m11WSvsiWr+ZpKINAbVCGt27b956BlMh8lW5APTSmTlqR5jnAZbDPLrljQ
 ZnB9KGGvkQHNG+n+wPz9KtmLKZfuvetLylDb8Z3so2quRS+XokiNDaVk3dGKG0BF6Iiy
 euSAF/CwPbrqXm52NRE7G/ZVmDKz7JtHFQ3JB5Qumqd5UnER30FfQoG3zjzy2hlNOQY9
 oc+BjM6LGr7AT4nHNX3eUuNzROZGV89wGbjCYGKr4Pde7xKzxCXqOCFxuFGzk3/kX/0f
 MwYH1xdTp69CAiYAntC/Fw+7QSlN18MuyssbvoVbAo9hkCaQnoUmuzmXLx5+2zcwgxNe
 QnAA==
X-Gm-Message-State: APjAAAX9m6ZKTUhc2xVGINAVUOlLVD8HMe9SaspdRh+ZT/6eV1g6FCN+
 bzLRJGckxPVzpYR7Zf9M29mSafRpL0A=
X-Google-Smtp-Source: APXvYqzIOfjDnwSrEt1k8ZqqvU8VeHQ045d+7/g/9gX0mKwHzYZzvbb62uk9e5dswBcz7Dv4lV2xmg==
X-Received: by 2002:aca:2307:: with SMTP id e7mr4954663oie.163.1580435993431; 
 Thu, 30 Jan 2020 17:59:53 -0800 (PST)
Received: from [192.168.128.77] (ip68-96-36-247.no.no.cox.net. [68.96.36.247])
 by smtp.gmail.com with ESMTPSA id 7sm2232996oin.5.2020.01.30.17.59.51
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jan 2020 17:59:52 -0800 (PST)
From: David J Chapper <dchapper@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: MacOS Mojave - Tunnel activation failure
Date: Thu, 30 Jan 2020 19:59:51 -0600
References: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
 <20200129124001.ak2fo6nr2bqp2ywk@iyo>
 <CAHmME9rEvnonTMZ95AyK1F1o2mwnBD06NkbVZ3prvz2nBSg1ng@mail.gmail.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <CAHmME9rEvnonTMZ95AyK1F1o2mwnBD06NkbVZ3prvz2nBSg1ng@mail.gmail.com>
Message-Id: <6A512C85-276D-4060-9F5B-7F5AA42962B8@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Fri, 07 Feb 2020 12:20:37 +0100
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
Content-Type: multipart/mixed; boundary="===============4054675582489773331=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============4054675582489773331==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E827A342-AE42-4A78-A7C0-A5B049C7144F"


--Apple-Mail=_E827A342-AE42-4A78-A7C0-A5B049C7144F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello, hoping someone else has experienced this and resolved the issue.

The Wireguard app has been running without issue for many months until =
today when I attempted to activate the tunnel and received the following =
error:

=E2=80=9CActivation failure=E2=80=9D Unable to retrieve tunnel =
information from the saved configuration.

If I try and edit the config the app crashes. Some details from the =
problem/crash report:

Process:               WireGuard [48844]
Path:                  =
/Applications/WireGuard.app/Contents/MacOS/WireGuard
Identifier:            com.wireguard.macos
Version:               0.0.20191105 (16)
App Item ID:           1451685025
App External ID:       833476010
Code Type:             X86-64 (Native)
Parent Process:        ??? [1]
Responsible:           WireGuard [48844]
User ID:               502

Date/Time:             2020-01-30 19:46:52.417 -0600
OS Version:            Mac OS X 10.14.6 (18G2022)
Report Version:        12
System Integrity Protection: enabled

Crashed Thread:        0  Dispatch queue: com.apple.main-thread

Exception Type:        EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes:       0x0000000000000001, 0x0000000000000000
Exception Note:        EXC_CORPSE_NOTIFY

Termination Signal:    Illegal instruction: 4
Termination Reason:    Namespace SIGNAL, Code 0x4
Terminating Process:   exc handler [48844]



--Apple-Mail=_E827A342-AE42-4A78-A7C0-A5B049C7144F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D"">Hello, hoping someone =
else has experienced this and resolved the issue.<br class=3D""><div =
class=3D""><br class=3D""></div><div class=3D"">The Wireguard app has =
been running without issue for many months until today when I attempted =
to activate the tunnel and received the following error:<div =
class=3D""><br class=3D""></div><div class=3D""><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D"">=E2=80=9CActivation failure=E2=80=9D&nbsp;</span></font><span =
style=3D"color: rgba(0, 0, 0, 0.85098); font-family: &quot;Helvetica =
Neue&quot;; font-size: 11px;" class=3D"">Unable to retrieve tunnel =
information from the saved configuration.</span></div></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; color: =
rgba(0, 0, 0, 0.85098);" class=3D""><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; color: =
rgba(0, 0, 0, 0.85098);" class=3D"">If I try and edit the config the app =
crashes. Some details from the problem/crash report:</div><div =
style=3D"margin: 0px; font-stretch: normal; font-size: 11px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; color: =
rgba(0, 0, 0, 0.85098);" class=3D""><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Process: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; WireGuard [48844]</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Path: &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;/Applications/WireGuard.app/Contents/MacOS/WireGuard</span></font></=
div><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Identifier: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;com.wireguard.macos</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Version: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 0.0.20191105 (16)</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">App Item ID: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 1451685025</span></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D"">App External ID: &nbsp; &nbsp; &nbsp; =
833476010</span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D"">Code Type: &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; X86-64 =
(Native)</span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D"">Parent Process: =
&nbsp; &nbsp; &nbsp; &nbsp;??? [1]</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Responsible: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; WireGuard [48844]</span></font></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D"">User ID: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
502</span></font></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D"">Date/Time: &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2020-01-30 19:46:52.417 =
-0600</span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D"">OS Version: &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Mac OS X 10.14.6 =
(18G2022)</span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D"">Report Version: =
&nbsp; &nbsp; &nbsp; &nbsp;12</span></font></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px; font-family: &quot;Helvetica Neue&quot;;" =
class=3D"">System Integrity Protection: enabled</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D""><br =
class=3D""></span></font></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D"">Crashed Thread: =
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;Dispatch queue: =
com.apple.main-thread</span></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D"">Exception Type: &nbsp; &nbsp; &nbsp; =
&nbsp;EXC_BAD_INSTRUCTION (SIGILL)</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Exception Codes: &nbsp; &nbsp; =
&nbsp; 0x0000000000000001, 0x0000000000000000</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Exception Note: &nbsp; &nbsp; =
&nbsp; &nbsp;EXC_CORPSE_NOTIFY</span></font></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D"">Termination Signal: &nbsp; &nbsp;Illegal instruction: =
4</span></font></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><font face=3D"Helvetica Neue" =
class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: =
rgba(0, 0, 0, 0.85098); font-size: 11px;" class=3D"">Termination Reason: =
&nbsp; &nbsp;Namespace SIGNAL, Code 0x4</span></font></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><font face=3D"Helvetica Neue" class=3D""><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85098); color: rgba(0, 0, 0, =
0.85098); font-size: 11px;" class=3D"">Terminating Process: &nbsp; exc =
handler [48844]</span></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D""><br class=3D""></span></font></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal;" class=3D""><font =
face=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, =
0, 0, 0.85098); color: rgba(0, 0, 0, 0.85098); font-size: 11px;" =
class=3D""><br class=3D""></span></font></div></div></div></body></html>=

--Apple-Mail=_E827A342-AE42-4A78-A7C0-A5B049C7144F--

--===============4054675582489773331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4054675582489773331==--

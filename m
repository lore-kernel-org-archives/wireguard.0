Return-Path: <SRS0=FSGf=3N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,T_KAM_HTML_FONT_INVALID
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2F2C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jan 2020 11:45:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FAE420678
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jan 2020 11:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="pjJuFFEC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FAE420678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2309ff75;
	Fri, 24 Jan 2020 11:45:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 571a11d5
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 10:14:30 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07efffc5
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 10:14:30 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id m26so2590789ljc.13
 for <wireguard@lists.zx2c4.com>; Thu, 23 Jan 2020 02:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=gbF+IKQqYu/a5DNSSNJRIdwCFAf0n5FhQEy5LHBn554=;
 b=pjJuFFECvn9pGyqnNOLakAHwezcmwszFxpAiC2TZ6i25ykibH03l05x2dZDGwT7VXV
 YS55qeX3LTxFHI7JUr7xutn1uTzBiz0OAEKqAHg+rahMLiIElMDHHLT6ClSb69PXkT9k
 rcWSZwmMD9bQf8cUTqXjrx915iBLuqKA4R3Xu6+seKmb+xj6ICTEKTWYj06uhnmGpN62
 WCsu5tROfmPkrdFn5iDeXLp6LTGkr7jTtuckQsmBudjhnY1zgE5dZb84ELkvEVv83mSW
 w41+QNKkDiehE8wo11PPoFJJN8mY2UqD9b7QDgoeeT/A+/5Cf/UzP77jr1BexoINChwV
 jfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=gbF+IKQqYu/a5DNSSNJRIdwCFAf0n5FhQEy5LHBn554=;
 b=m0unh+Jd5SJVOlGAdmHKBRM13G2pEXWwo+Mh0P4Ao5uJ+yyXZ9FK0f2akmBZz9Of+7
 /ny3ojZHffCqGwtNRqOm6Q4njIa+5tkIz5nwpT3PgfPLKNJ31kFfMiCtrWN4+YBpdM8s
 zSATQ46NMlnZ4tfQHVgC+Yv/wTXRmEnBx1OaCPuiL+YQSUq1Q6Kk3WMbL8use/ebHReg
 lqweoDXjHIZ9gp2xtC4koXisMorJuQ22VnFbjDFyeHfVPrqyxkR6a524G1miEt0+FX+Q
 ZfbtOgZf3MDdIbWCk4rOzJPDiLEcZp0X10MmNp8xvOqATIOrwvDmgprPtrvAtw0HqFR1
 z/9Q==
X-Gm-Message-State: APjAAAUh+EPt0RnsgvTsD5FFrwbJdy98qlEEZsQHCnf47MfmBgEc2TAv
 U/OsyBYZTPmGkG86Q+00ZPu40w==
X-Google-Smtp-Source: APXvYqxXtWLgELgNIFYeWjTSgxVoXl6urb7daqteejz/cqbEquAGX5Cdv+VDpSE3X8v8koma4VJGmA==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr22409787ljj.270.1579774467272; 
 Thu, 23 Jan 2020 02:14:27 -0800 (PST)
Received: from [10.65.212.57] ([185.213.154.226])
 by smtp.gmail.com with ESMTPSA id f11sm805697lfm.12.2020.01.23.02.14.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 02:14:26 -0800 (PST)
From: Andrej Mihajlov <and@mullvad.net>
Message-Id: <806BAAAF-D9C8-423A-82B1-B6FEF853CAFB@mullvad.net>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Wireguard on MacOS (Catalina) not able to quit/deactivate
Date: Thu, 23 Jan 2020 11:14:21 +0100
In-Reply-To: <CAO=kRDLXM+D+dfq6D4mkgPrE8saXknksrPxvQsw3E9EOK3gzhA@mail.gmail.com>
To: Revath S Kumar <gmail@revathskumar.com>
References: <CAO=kRDJJ6m1RMad-nwLro6kp7FhST9j1gP+C45xQx1R7sC932g@mail.gmail.com>
 <CAO=kRDLXM+D+dfq6D4mkgPrE8saXknksrPxvQsw3E9EOK3gzhA@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Mailman-Approved-At: Fri, 24 Jan 2020 12:45:26 +0100
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
Content-Type: multipart/mixed; boundary="===============1601044182602302878=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1601044182602302878==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6358F2E9-5A3A-4A16-B1D6-AB14AAA8CBC8"


--Apple-Mail=_6358F2E9-5A3A-4A16-B1D6-AB14AAA8CBC8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I see the same issue. Possible side effect of having `exit(0)` in =
`stopTunnel`?

=
https://github.com/WireGuard/wireguard-apple/blob/master/WireGuard/WireGua=
rdNetworkExtension/PacketTunnelProvider.swift#L102 =
<https://github.com/WireGuard/wireguard-apple/blob/master/WireGuard/WireGu=
ardNetworkExtension/PacketTunnelProvider.swift#L102>

Cheers,
Andrej

> On 16 Jan 2020, at 15:18, Revath S Kumar <gmail@revathskumar.com> =
wrote:
>=20
> Found the issue.=20
> This is due to On demand option is ON.=20
>=20
> Once On demand is OFF you can deactivate and quit.
>=20
>=20
> On Wed, Nov 27, 2019 at 7:45 AM Revath S Kumar <gmail@revathskumar.com =
<mailto:gmail@revathskumar.com>> wrote:
> Hello all,
>=20
> I installed wireguard on MacOS (Catalina) recently.
> After I configured and activated once, I am not able to =
quit/deactivate the wireguard session.
> I am attaching Gifs for your reference. [1]
>=20
>  Even I tried to kill the process via Activity Monitor but a process =
names WireguardNetworkExtension, shows up again. [2]
>=20
> [1]: https://imgur.com/CEm4cXM <https://imgur.com/CEm4cXM>
> [2]: https://imgur.com/xC8uCUy <https://imgur.com/xC8uCUy>
>=20
> with regards,
> Revath S Kumar,
> JavaScripter / Rubyist=20
> https://blog.revathskumar.com/ =
<https://blog.revathskumar.com/>__________________________________________=
_____
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--Apple-Mail=_6358F2E9-5A3A-4A16-B1D6-AB14AAA8CBC8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D"">Hi,</div><div class=3D""><br class=3D""></div><div class=3D"">I=
 see the same issue. Possible side effect of having `exit(0)` in =
`stopTunnel`?</div><div class=3D""><br class=3D""></div><div class=3D""><a=
 =
href=3D"https://github.com/WireGuard/wireguard-apple/blob/master/WireGuard=
/WireGuardNetworkExtension/PacketTunnelProvider.swift#L102" =
class=3D"">https://github.com/WireGuard/wireguard-apple/blob/master/WireGu=
ard/WireGuardNetworkExtension/PacketTunnelProvider.swift#L102</a></div><di=
v class=3D""><br class=3D""></div><div class=3D"">Cheers,</div><div =
class=3D"">Andrej</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On 16 Jan 2020, at 15:18, Revath S Kumar =
&lt;<a href=3D"mailto:gmail@revathskumar.com" =
class=3D"">gmail@revathskumar.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"">Found the issue. <br class=3D""></div><div =
class=3D"">This is due to<b class=3D""> On demand</b> option is <b =
class=3D"">ON</b>. <br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D"">Once <b class=3D"">On demand </b>is OFF =
you can deactivate and quit.<br class=3D""></div></div><br class=3D""><br =
class=3D""><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Nov 27, 2019 at 7:45 AM Revath S Kumar =
&lt;<a href=3D"mailto:gmail@revathskumar.com" =
class=3D"">gmail@revathskumar.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr" class=3D""><div =
class=3D"">Hello all,</div><div class=3D""><br class=3D""></div><div =
class=3D"">I installed wireguard on MacOS (Catalina) recently.</div><div =
class=3D"">After I configured and activated once, I am not able to =
quit/deactivate the wireguard session.</div><div class=3D"">I am =
attaching Gifs for your reference. [1]<br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D"">&nbsp;Even I tried to =
kill the process via Activity Monitor but a process names <b =
class=3D"">WireguardNetworkExtension, </b>shows up again. [2]<br =
class=3D""></div><div class=3D""><br class=3D""></div><div class=3D"">[1]:=
 <span style=3D"background-image: unset; background-size: unset; =
background-attachment: unset; background-origin: unset; background-clip: =
unset; background-color: unset; background-blend-mode: unset; border: =
unset unset unset; border-top-left-radius: unset; =
border-top-right-radius: unset; border-bottom-right-radius: unset; =
border-bottom-left-radius: unset; display: unset; float: unset; clear: =
unset; vertical-align: unset; overflow: unset; isolation: unset; =
break-after: unset; break-before: unset; break-inside: unset; =
column-width: unset; column-count: unset; column-fill: unset; =
column-rule-width: unset; column-rule-style: unset; column-rule-color: =
unset; opacity: unset; mix-blend-mode: unset; font-family: unset; =
font-size: unset; font-style: unset; font-variant-caps: unset; =
font-weight: unset; font-stretch: unset; line-height: unset; =
font-synthesis: unset; writing-mode: unset; border-collapse: unset; =
empty-cells: unset; caption-side: unset; border-spacing: unset; =
text-transform: unset; text-indent: unset; word-break: unset; =
text-align: unset; letter-spacing: unset; word-spacing: unset; =
white-space: pre-wrap; -webkit-text-emphasis-style: unset; =
-webkit-text-emphasis-color: unset; line-break: unset; list-style: unset =
unset unset; quotes: unset; margin: unset; outline: unset unset unset; =
padding: unset; width: unset; min-width: unset; max-width: unset; =
height: unset; min-height: unset; max-height: unset; box-sizing: unset; =
object-fit: unset; object-position: unset; table-layout: unset; =
text-overflow: unset; text-decoration: unset; background-position: unset =
unset; background-repeat: unset unset;" class=3D""><a =
href=3D"https://imgur.com/CEm4cXM" target=3D"_blank" =
class=3D"">https://imgur.com/CEm4cXM</a></span></div><div class=3D""><span=
 style=3D"background-image: unset; background-size: unset; =
background-attachment: unset; background-origin: unset; background-clip: =
unset; background-color: unset; background-blend-mode: unset; border: =
unset unset unset; border-top-left-radius: unset; =
border-top-right-radius: unset; border-bottom-right-radius: unset; =
border-bottom-left-radius: unset; display: unset; float: unset; clear: =
unset; vertical-align: unset; overflow: unset; isolation: unset; =
break-after: unset; break-before: unset; break-inside: unset; =
column-width: unset; column-count: unset; column-fill: unset; =
column-rule-width: unset; column-rule-style: unset; column-rule-color: =
unset; opacity: unset; mix-blend-mode: unset; font-family: unset; =
font-size: unset; font-style: unset; font-variant-caps: unset; =
font-weight: unset; font-stretch: unset; line-height: unset; =
font-synthesis: unset; writing-mode: unset; border-collapse: unset; =
empty-cells: unset; caption-side: unset; border-spacing: unset; =
text-transform: unset; text-indent: unset; word-break: unset; =
text-align: unset; letter-spacing: unset; word-spacing: unset; =
white-space: pre-wrap; -webkit-text-emphasis-style: unset; =
-webkit-text-emphasis-color: unset; line-break: unset; list-style: unset =
unset unset; quotes: unset; margin: unset; outline: unset unset unset; =
padding: unset; width: unset; min-width: unset; max-width: unset; =
height: unset; min-height: unset; max-height: unset; box-sizing: unset; =
object-fit: unset; object-position: unset; table-layout: unset; =
text-overflow: unset; text-decoration: unset; background-position: unset =
unset; background-repeat: unset unset;" class=3D"">[2]: <span =
style=3D"background-image: unset; background-size: unset; =
background-attachment: unset; background-origin: unset; background-clip: =
unset; background-color: unset; background-blend-mode: unset; border: =
unset unset unset; border-top-left-radius: unset; =
border-top-right-radius: unset; border-bottom-right-radius: unset; =
border-bottom-left-radius: unset; display: unset; float: unset; clear: =
unset; vertical-align: unset; overflow: unset; isolation: unset; =
break-after: unset; break-before: unset; break-inside: unset; =
column-width: unset; column-count: unset; column-fill: unset; =
column-rule-width: unset; column-rule-style: unset; column-rule-color: =
unset; opacity: unset; mix-blend-mode: unset; font-family: unset; =
font-size: unset; font-style: unset; font-variant-caps: unset; =
font-weight: unset; font-stretch: unset; line-height: unset; =
font-synthesis: unset; writing-mode: unset; border-collapse: unset; =
empty-cells: unset; caption-side: unset; border-spacing: unset; =
text-transform: unset; text-indent: unset; word-break: unset; =
text-align: unset; letter-spacing: unset; word-spacing: unset; =
white-space: pre-wrap; -webkit-text-emphasis-style: unset; =
-webkit-text-emphasis-color: unset; line-break: unset; list-style: unset =
unset unset; quotes: unset; margin: unset; outline: unset unset unset; =
padding: unset; width: unset; min-width: unset; max-width: unset; =
height: unset; min-height: unset; max-height: unset; box-sizing: unset; =
object-fit: unset; object-position: unset; table-layout: unset; =
text-overflow: unset; text-decoration: unset; background-position: unset =
unset; background-repeat: unset unset;" class=3D""><a =
href=3D"https://imgur.com/xC8uCUy" target=3D"_blank" =
class=3D"">https://imgur.com/xC8uCUy</a></span></span></div><div =
class=3D""><br class=3D""></div><div class=3D""><div dir=3D"ltr" =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D"">with regards,<br class=3D"">Revath =
S Kumar,<br class=3D""><div class=3D""><span class=3D"">JavaScripter / =
</span>Rubyist <br class=3D""></div><div class=3D""><a =
href=3D"https://blog.revathskumar.com/" target=3D"_blank" =
class=3D"">https://blog.revathskumar.com/</a></div></div></div></div></div=
></div></div></div></div></div></div>
</blockquote></div>
_______________________________________________<br class=3D"">WireGuard =
mailing list<br class=3D""><a href=3D"mailto:WireGuard@lists.zx2c4.com" =
class=3D"">WireGuard@lists.zx2c4.com</a><br =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_6358F2E9-5A3A-4A16-B1D6-AB14AAA8CBC8--

--===============1601044182602302878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1601044182602302878==--

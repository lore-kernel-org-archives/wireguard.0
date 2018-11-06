Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C54C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 16:19:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092412081D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 16:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="CJUUE03G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092412081D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edf43275;
	Tue, 6 Nov 2018 16:15:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a70c91d
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 16:15:02 +0000 (UTC)
Received: from sonic308-36.consmr.mail.gq1.yahoo.com
 (sonic308-36.consmr.mail.gq1.yahoo.com [98.137.68.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2c7c4dd
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1541521164; bh=PX7YWpadgkXIgAAF9NpQL/2AvUqFHCiggooWdjxP3HY=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=CJUUE03GvJBUswYlGBQc2xCblBsYLti7ygQAm+raLNIQze626nUpv0THjKunnxGivmFLo8TEocVh7LYmoytLrFjlcMeRfU1XLir9dCA/jEKAEhWyUuZKyIMPuEMDkx1k3T2e5r+FWXuwnNYZ+a/BYKTmGP0aSGM+UmeNyxBpOyQKjTRblypadgo4A9paRLAow7MzhlZngwlxhcC7hY8eNO7iaNeAYYlibthSRr98bhWZ2AgNw/6JkwUBLeMHd8+qThZVaZux5WHvBpmiXkeECd731ToQjVMHeSCIw2nB5gjMfaWpsTezueDcJTzGJIzlRjauz5so9NBtw7QWV8hbPQ==
X-YMail-OSG: tonRE78VM1mQSJZJ1tEo6x3Np34lEzYzw8cHp.4GpIcx7AmZ4yIUGve3b4luDUb
 OVMjjBEux6LrI.RsysR4xQwiTcPKanbeKAkK0OxNVbzPbfe5j7_k2LXrpENqaM0BEk6TyUPG1F31
 BxdV5Xrz4U3SdI9tv2ZlcYqFvzB9yrrR2EAY_6q_YIoqbD8JT.Z.sXpkJVAlyH4GNdFO1OLCkgBJ
 LkYrS_iS07xqXcrryxiWtu013t3QDgaYaaKfsgxYJgfshV14gP2Bvy8LvNctUmltbLYqzCQPm67i
 ioZ.yO4W2QPUhzPATuXiVN83_izuzQYcWNwZDYbyGus_ocF_jmACneGtNaxCDwuA_iiQ.3.vm6_.
 YJDuJblPHQgh0Q8uMENfP.c.Q.lu3_QCF.fCsBw_rL3AZBpoDUDHg7YVvEAmoALKOOmPWdM_1FD.
 CvCMFF4bVmXOiBgXWaZspIM7.AK_hFk._.Cbj2oOHAVqOr.qvZ1ZeBk.g7B2SymmplRkCGFK12KW
 3VqVOKLUUZ0cbhzH7XRMsmoqoFaCig2RO4kKrmh8oeRZ5N3fc1caJEGLanW4Rh94Krf9BgSDqDv0
 l62uTnzWNjy7h1qA2vdOPYtSp8cCVWSHBzFTMw06KCg3RVZvD5ihX_AW_Uj97UTCTckcvKJcoCmH
 QQxTfumip8Zy_rQ27.wcWl5R0hG0zTeLlTFiVGlRD772e2gM1WzvmyWNP7WRDoUh3AjrjFqDZ.Sj
 mMhxoafvPFEDo1IvfLhqBQ2liaIsd77CIAvYlrcFOdADjZBygYoxiUZvxYUAXgdj9OOViQb3fcRj
 JbdfuUzjW62jpzcEVaPUchHmF2Wuary6VCSZ9KswNsupTgDdaNn7dDb_M1UlsxRTf7qBqcvc1YTG
 GthtrdbPujhQfWn1XTKSMVt6.zGoa5UtMitiJy5yZeerL8qptd.Vtsto4JcKqznE8Z_6NX1rFxof
 iQj_2qsqlWxgLmAwR4nHZRP2m5uZcvxtYzY26yuYifwDxe9TU2E4_jNxC90GfSKle7zWs6dv1oYF
 yKPSrNxFxO73Pw43dj8wlEvpH8u1xl896IEYb.A41gJC4xcpeuawvJacJO0jLhY4-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Tue, 6 Nov 2018 16:19:24 +0000
Date: Tue, 6 Nov 2018 16:15:20 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <177318293.1785668.1541520920278@mail.yahoo.com>
In-Reply-To: <2036724358.1451767.1541469968454@mail.yahoo.com>
References: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
 <2036724358.1451767.1541469968454@mail.yahoo.com>
Subject: Re: WireGuard for iOS - TestFlight
MIME-Version: 1.0
X-Mailer: WebService/1.1.12711 YahooMailIosMobile Raven/43531
 CFNetwork/975.0.3 Darwin/18.2.0
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
Content-Type: multipart/mixed; boundary="===============4487335665855226679=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4487335665855226679==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1785667_737389839.1541520920275"
Content-Length: 9654

------=_Part_1785667_737389839.1541520920275
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thank you Jason and all those involved. Question for you... not sure how familiar you are with iOS kernel internals, but considering Apple's "Interest in privacy," what would it take for iOS to have similar kernel changes to support Wireguard natively akin to IKEv2, etc? Keep in mind that Darwin - iOS/macOS underpinnings are FreeBSD based.


Thanks,Jose
On Monday, November 5, 2018, 9:06 PM, Jose Marinez <jedi_papi@yahoo.com> wrote:

Thank you Jason and all those involved. Question for you... not sure how familiar you are with iOS kernel internals, but considering Apple's "Interest in privacy," what would it take for iOS to have similar kernel changes to support Wireguard natively akin to IKEv2, etc? Keep in mind that Darwin - iOS/macOS underpinnings are FreeBSD based.


Thanks,Jose

On Monday, November 5, 2018, 4:27 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

Hey folks,

For the last few weeks, Roopesh and I have been hard at work on the
WireGuard for iOS app. Today we're happy to share a
likely-buggy-and-broken TestFlight that you can run on your phone:
<https://testflight.apple.com/join/63I19SDT>. As usual, use at your
own risk, especially since it's alpha quality.

Please let us know about any bugs as you find them -- you can send
them to me or to team@wireguard.com. Our current TODO list lives here
[1], linked via the main project TODO list [2], and if you're an iOS
person and want to contribute code, we'd be happy to have you on
board.

The app costs $3.99 and requires an email address to sign up; we
manage all your tunnels for you in the cloud. JUST KIDDING! Like the
rest of WireGuard, the iOS app is free and open source [3]. I make
this rather tasteless joke, because of the rather surprising
quantities of people encouraging me to do the iOS stuff as proprietary
paid software, because "apple users will pay" or because "open source
is cool, but iphone folks don't care about it so you can get away with
charging" or because "none of the other vpn players are doing open
source mobile implementations" or even because "apple is more likely
to accept paid software into its app store" and so on and so forth.
But, as usual, I much prefer for this to be a community project than a
closed one, and so like everything else, it's FLOSS.

Enjoy! And do let us know about the bugs as you run into them. I'm
sure there are plenty.

Regards,
Jason

[1] https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ6LYGY
[2] https://www.wireguard.com/todo/
[3] https://git.zx2c4.com/wireguard-ios/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard







------=_Part_1785667_737389839.1541520920275
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy>
<span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, =
255, 255, 0);">Thank you Jason and all those involved. Question for you... =
not sure how familiar you are with iOS kernel internals, but considering Ap=
ple's "Interest in privacy," what would it take for iOS to have similar ker=
nel changes to support Wireguard natively akin to IKEv2, etc? Keep in mind =
that Darwin - iOS/macOS underpinnings are FreeBSD based.<br clear=3D"none" =
style=3D"word-break: break-word;"><br clear=3D"none" style=3D"word-break: b=
reak-word;"><br clear=3D"none" style=3D"word-break: break-word;">Thanks,</s=
pan><div style=3D"word-break: break-word;"><span style=3D"-webkit-text-size=
-adjust: auto; background-color: rgba(255, 255, 255, 0);">Jose</span></div>=
<p class=3D"yahoo-quoted-begin" style=3D"font-size: 15px; color: #715FFA; p=
adding-top: 15px; margin-top: 0">On Monday, November 5, 2018, 9:06 PM, Jose=
 Marinez &lt;jedi_papi@yahoo.com&gt; wrote:</p><blockquote class=3D"iosymai=
l"><div id=3D"yiv3943249201"><div>
Thank you Jason and all those involved. Question for you... not sure how fa=
miliar you are with iOS kernel internals, but considering Apple's "Interest=
 in privacy," what would it take for iOS to have similar kernel changes to =
support Wireguard natively akin to IKEv2, etc? Keep in mind that Darwin - i=
OS/macOS underpinnings are FreeBSD based.<br clear=3D"none"><br clear=3D"no=
ne"><br clear=3D"none">Thanks,<div>Jose</div><br clear=3D"none"><div class=
=3D"yiv3943249201yqt2786841166" id=3D"yiv3943249201yqt83640"><p class=3D"yi=
v3943249201yahoo-quoted-begin" style=3D"font-size:15px;color:#715FFA;paddin=
g-top:15px;margin-top:0;">On Monday, November 5, 2018, 4:27 PM, Jason A. Do=
nenfeld &lt;Jason@zx2c4.com&gt; wrote:</p><blockquote class=3D"yiv394324920=
1iosymail"><div dir=3D"ltr">Hey folks,<br clear=3D"none"></div><div dir=3D"=
ltr"><br clear=3D"none"></div><div dir=3D"ltr">For the last few weeks, Roop=
esh and I have been hard at work on the<br clear=3D"none"></div><div dir=3D=
"ltr">WireGuard for iOS app. Today we're happy to share a<br clear=3D"none"=
></div><div dir=3D"ltr">likely-buggy-and-broken TestFlight that you can run=
 on your phone:<br clear=3D"none"></div><div dir=3D"ltr">&lt;<a rel=3D"nofo=
llow" shape=3D"rect" target=3D"_blank" href=3D"https://testflight.apple.com=
/join/63I19SDT">https://testflight.apple.com/join/63I19SDT</a>&gt;. As usua=
l, use at your<br clear=3D"none"></div><div dir=3D"ltr">own risk, especiall=
y since it's alpha quality.<br clear=3D"none"></div><div dir=3D"ltr"><br cl=
ear=3D"none"></div><div dir=3D"ltr">Please let us know about any bugs as yo=
u find them -- you can send<br clear=3D"none"></div><div dir=3D"ltr">them t=
o me or to <a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailto:team@wiregu=
ard.com." target=3D"_blank" href=3D"mailto:team@wireguard.com.">team@wiregu=
ard.com.</a> Our current TODO list lives here<br clear=3D"none"></div><div =
dir=3D"ltr">[1], linked via the main project TODO list [2], and if you're a=
n iOS<br clear=3D"none"></div><div dir=3D"ltr">person and want to contribut=
e code, we'd be happy to have you on<br clear=3D"none"></div><div dir=3D"lt=
r">board.<br clear=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></div=
><div dir=3D"ltr">The app costs $3.99 and requires an email address to sign=
 up; we<br clear=3D"none"></div><div dir=3D"ltr">manage all your tunnels fo=
r you in the cloud. JUST KIDDING! Like the<br clear=3D"none"></div><div dir=
=3D"ltr">rest of WireGuard, the iOS app is free and open source [3]. I make=
<br clear=3D"none"></div><div dir=3D"ltr">this rather tasteless joke, becau=
se of the rather surprising<br clear=3D"none"></div><div dir=3D"ltr">quanti=
ties of people encouraging me to do the iOS stuff as proprietary<br clear=
=3D"none"></div><div dir=3D"ltr">paid software, because "apple users will p=
ay" or because "open source<br clear=3D"none"></div><div dir=3D"ltr">is coo=
l, but iphone folks don't care about it so you can get away with<br clear=
=3D"none"></div><div dir=3D"ltr">charging" or because "none of the other vp=
n players are doing open<br clear=3D"none"></div><div dir=3D"ltr">source mo=
bile implementations" or even because "apple is more likely<br clear=3D"non=
e"></div><div dir=3D"ltr">to accept paid software into its app store" and s=
o on and so forth.<br clear=3D"none"></div><div dir=3D"ltr">But, as usual, =
I much prefer for this to be a community project than a<br clear=3D"none"><=
/div><div dir=3D"ltr">closed one, and so like everything else, it's FLOSS.<=
br clear=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></div><div dir=
=3D"ltr">Enjoy! And do let us know about the bugs as you run into them. I'm=
<br clear=3D"none"></div><div dir=3D"ltr">sure there are plenty.<br clear=
=3D"none"></div><div dir=3D"ltr"><br clear=3D"none"></div><div dir=3D"ltr">=
Regards,<br clear=3D"none"></div><div dir=3D"ltr">Jason<br clear=3D"none"><=
/div><div dir=3D"ltr"><br clear=3D"none"></div><div dir=3D"ltr">[1] <a rel=
=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"https://docs.google.=
com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ6LYGY">https://docs.g=
oogle.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ6LYGY</a><br cl=
ear=3D"none"></div><div dir=3D"ltr">[2] <a rel=3D"nofollow" shape=3D"rect" =
target=3D"_blank" href=3D"https://www.wireguard.com/todo/">https://www.wire=
guard.com/todo/</a><br clear=3D"none"></div><div dir=3D"ltr">[3] <a rel=3D"=
nofollow" shape=3D"rect" target=3D"_blank" href=3D"https://git.zx2c4.com/wi=
reguard-ios/">https://git.zx2c4.com/wireguard-ios/</a><br clear=3D"none"></=
div><div dir=3D"ltr">_______________________________________________<br cle=
ar=3D"none"></div><div dir=3D"ltr">WireGuard mailing list<br clear=3D"none"=
></div><div dir=3D"ltr"><a rel=3D"nofollow" shape=3D"rect" ymailto=3D"mailt=
o:WireGuard@lists.zx2c4.com" target=3D"_blank" href=3D"mailto:WireGuard@lis=
ts.zx2c4.com">WireGuard@lists.zx2c4.com</a><br clear=3D"none"></div><div di=
r=3D"ltr"><a rel=3D"nofollow" shape=3D"rect" target=3D"_blank" href=3D"http=
s://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mai=
lman/listinfo/wireguard</a><br clear=3D"none"></div><blockquote></blockquot=
e></blockquote></div>
</div></div><blockquote></blockquote></blockquote>
</body></html>
------=_Part_1785667_737389839.1541520920275--

--===============4487335665855226679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4487335665855226679==--

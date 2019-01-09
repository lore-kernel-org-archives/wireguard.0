Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6360FC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jan 2019 18:12:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3922A214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jan 2019 18:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=chmd-fr.20150623.gappssmtp.com header.i=@chmd-fr.20150623.gappssmtp.com header.b="MtikHcXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3922A214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chmd.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40f71678;
	Wed, 9 Jan 2019 18:08:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2551a2a
 for <wireguard@lists.zx2c4.com>; Wed, 9 Jan 2019 18:08:39 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fe83190
 for <wireguard@lists.zx2c4.com>; Wed, 9 Jan 2019 18:08:39 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d39so8034224edb.12
 for <wireguard@lists.zx2c4.com>; Wed, 09 Jan 2019 10:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chmd-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdzXaVdvhOLrN8xJwxwSfHySmzUfv7W86JAMDGBtDC0=;
 b=MtikHcXB0MtQtKFjPE5rEncjfrB/ZYxI8NTzl7eZ9HZH7h3xj/9n1YNCFkdhG7IQR0
 wBvuKs2tyqdgqL1wIeHJL7i2O5JTUFuDzf6OhhYunTpKJIQR5n5kVrxDbqD4gYT8V6lQ
 7f5HfXAPwHA4lrxUzmBPMZg+B1RlL+CabFfQUPjknD9YHcspzs4WD8QOwwoKOtA8kI5k
 8owPto1CDaiE+Zyko/1j7tMJG4vE3AIoB066IsxX/bh+Q5hL91KwH8tcCbUbRc62zka/
 wzOoTrWlP8Q53GPTFARm/ZMBO15hUjr0zNRa6n3Kxs3guML1BsU1Hc9gYexBk8m2tz3p
 0ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdzXaVdvhOLrN8xJwxwSfHySmzUfv7W86JAMDGBtDC0=;
 b=PlDqALvx+wIbkDH9N4wAVk06eJpRDs/LSHtcMEOBtGLDXjkLXYt9/QMiPDvBazQCMK
 imDOqm1q5feeKXGS/rRsdHEl685z7EUCTw7Vs/gSZUQNHa3glTQcV1MJwkjeCg0c1X5s
 S4LU0vSNHv/VVVYv9rhSci7aRpKkNeFXpF8SEgbew9YaWQdgtmrLygsSuFzgDGpp9adg
 1nxmqcrdqa23XET+eL+lACKqHue1c+hOZdkivULPyYW/NfXN8JHXzPop6vKFrR/8giRP
 yvN8JjDwQE+a3CaFz+EY44QWeTfKWKdZWQAP8C9FOkIVXhBiFM80+RQks0oTIhg3TQTy
 SZQA==
X-Gm-Message-State: AJcUukeX2Nnrelcf+13Tf7XpBVb2PPgjzjPGWq31g9pl/kR0ja2/kZ25
 E4rIcQnAsKjWrW3CLVWMhvd5iv9FmNmFgVzTFEM=
X-Google-Smtp-Source: ALg8bN6Utr5XczpsUxNi2s5D0hwGY9r3c1pLn2Krmg6NijA1fACQFfPuHYg2CLij2y1xamjV/x5D/9FsUEkdctjeoXk=
X-Received: by 2002:a50:de88:: with SMTP id c8mr6868684edl.129.1547057515892; 
 Wed, 09 Jan 2019 10:11:55 -0800 (PST)
MIME-Version: 1.0
References: <CAHLp1Y=_RavxCeoV5nQ+R96GTiY+jF9gvNox25B2XO9CVU+jMQ@mail.gmail.com>
 <CAKXLc7f_aDxkasodm0YCBysd63we-L1FeTnsRoZbTvckzEUp0A@mail.gmail.com>
 <CAHLp1Ykc8mA=WCX+P_fmfUi8DLmSSUo1DpNx6XKnV7wLWwf9uw@mail.gmail.com>
 <CAHLp1Ym2RyhT_FoNrJQVZ8gVK=dPEJsZk0wDeOPvL_ibUSTLRw@mail.gmail.com>
In-Reply-To: <CAHLp1Ym2RyhT_FoNrJQVZ8gVK=dPEJsZk0wDeOPvL_ibUSTLRw@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Wed, 9 Jan 2019 19:11:43 +0100
Message-ID: <CAHLp1Y=kj0Lq0SpFbgh5M-QkphChkZsNd+U9SN5QoSOdF60O4Q@mail.gmail.com>
Subject: Re: [Android] Wireguard on the Amazon FireTV stick
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Cc: wireguard <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8327863011737688880=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8327863011737688880==
Content-Type: multipart/alternative; boundary="000000000000ae94d1057f0a65a8"

--000000000000ae94d1057f0a65a8
Content-Type: text/plain; charset="UTF-8"

Hi again,

I managed to enable the interface by sending a tap event through the adb
shell ("input tap 1000 100"), which brought the tunnel editor, from which
it is possible to navigate to the enable button.

And the answer is... It works!

I could verify that, when using a browser on the Fire TV, my public address
was the one of my VPN server. Quite handy if you want to take your stick on
holidays and still be able to watch content from your home country, for
example.

This is obviously hacky. In order to be usable, the app would need to
handle the navigation key events. I noticed that It already handles
KEYCODE_BACK, so I guess this could go together. Amazon has a section about
it on their documentation [1].

Cheers,
Christophe-Marie

[1]: https://developer.amazon.com/docs/fire-tv/remote-input.html

On Wed, Jan 9, 2019 at 12:07 AM Christophe-Marie Duquesne <chmd@chmd.fr>
wrote:

> Looks like the intent com.wireguard.android.action.SET_TUNNEL_UP does not
> do much. I tried to start the tunnel like this:
>
> am broadcast -a com.wireguard.android.action.SET_TUNNEL_UP -e tunnel wg0
> -n com.wireguard.android/.model.TunnelManager
>
> After further investigation, the code to handle this intent is deactivated
> [1]. Any help would be appreciated!
>
> [1]:
> https://git.zx2c4.com/wireguard-android/tree/app/src/main/java/com/wireguard/android/model/TunnelManager.java#n275
>

--000000000000ae94d1057f0a65a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi again,</div><div><br></div><div>I=
 managed to enable the interface by sending a tap event through the adb she=
ll (&quot;input tap 1000 100&quot;), which brought the tunnel editor, from =
which it is possible to navigate to the enable button.</div><div><br></div>=
<div>And the answer is... It works!</div><div><br></div><div>I could verify=
 that, when using a browser on the Fire TV, my public address was the one o=
f my VPN server. Quite handy if you want to take your stick on holidays and=
 still be able to watch content from your home country, for example.</div><=
div><br></div><div>This is obviously hacky. In order to be usable, the app =
would need to handle the navigation key events. I noticed that It already h=
andles KEYCODE_BACK, so I guess this could go together. Amazon has a sectio=
n about it on their documentation [1].<br></div><div><br></div><div>Cheers,=
</div><div>Christophe-Marie</div><div><br></div><div>[1]: <a href=3D"https:=
//developer.amazon.com/docs/fire-tv/remote-input.html">https://developer.am=
azon.com/docs/fire-tv/remote-input.html</a><br></div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jan 9, 2019 at 12:07 AM Chris=
tophe-Marie Duquesne &lt;<a href=3D"mailto:chmd@chmd.fr">chmd@chmd.fr</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div dir=3D"ltr"><div dir=3D"ltr">Looks like the intent com.wireguard.a=
ndroid.action.SET_TUNNEL_UP does not do much. I tried to start the tunnel l=
ike this:<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">am broadcast=
 -a com.wireguard.android.action.SET_TUNNEL_UP -e tunnel wg0 -n com.wiregua=
rd.android/.model.TunnelManager</div><div dir=3D"ltr"><br></div><div>After =
further investigation, the code to handle this intent is deactivated [1]. A=
ny help would be appreciated!</div><div><br></div><div>[1]: <a href=3D"http=
s://git.zx2c4.com/wireguard-android/tree/app/src/main/java/com/wireguard/an=
droid/model/TunnelManager.java#n275" target=3D"_blank">https://git.zx2c4.co=
m/wireguard-android/tree/app/src/main/java/com/wireguard/android/model/Tunn=
elManager.java#n275</a><br></div></div></div></div></div></div></div>
</blockquote></div>

--000000000000ae94d1057f0a65a8--

--===============8327863011737688880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8327863011737688880==--

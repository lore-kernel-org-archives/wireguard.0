Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E64C10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:54:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B13B32146F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 11:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=varunpriolkar-com.20150623.gappssmtp.com header.i=@varunpriolkar-com.20150623.gappssmtp.com header.b="WwBu1llW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B13B32146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=varunpriolkar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37e31e7c;
	Sat, 6 Apr 2019 11:51:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54dd057b
 for <wireguard@lists.zx2c4.com>; Fri, 5 Apr 2019 18:45:40 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e69f8b8d
 for <wireguard@lists.zx2c4.com>; Fri, 5 Apr 2019 18:45:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id f23so6173380ljc.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Apr 2019 11:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=varunpriolkar-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vXBggSMQXKbCbe9PJSTWH5DmMCvghP3F0daMwFzSZYQ=;
 b=WwBu1llWAvAELYfvHsCnbOsupJBdio6Rhg0g/DddPv40PZcc4Dyx9rJCZ8pw2KdV0C
 7ow+gB+hT/0OEsnKhGf3UIXVfym5Hbd5Kz15MZvlUZmkCXo1Z0CrtbdYRVq3RaViHboV
 +df0CdPhIPM0kw58gb5jgXJ857vDvN2bFCV+kr9788FDDYP7qnZt5AyUAtWowCi54HZ+
 lL9Q1E6TOKocqO8KNdXfBpz/7fArs9Fayn6rCt7vUxLBuL7y8/TFE8VoR08UnDDGWLEO
 VKRKVGpo8VL8baTa4guBFKyhZjXxC4XZsZpqVCQxmBXW25OsotIzhqDEf9XT8WwWOpzX
 7nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXBggSMQXKbCbe9PJSTWH5DmMCvghP3F0daMwFzSZYQ=;
 b=t9GMvasdVMojN0ZW7g8V8G8fdSzkjVvrxiP5pHqHZ1yXDpDUpuaQfdlhIv/J1w8vVZ
 jaU3JoaECx4Jn5r3MECR/Z5MN2iqt+ueB2NMcObIzXcOK5Op90h8UE1v33dSv9ub9liN
 n0vghhaYOjwADvN6ntFgl4QRCQjFhFXIGb8G6i+2O6t03Fdjclw4KVhJuf2N2t/JzsVu
 VVeFJUC+f30Kdh0Gfy6/2zUssQJGScW+I4t07cQyWEHH6TuaubO7zUKc4US5sZYKTpq8
 qX5aL8dD0UjgryEd7yq0UsOpArB0fXodg7CvHZYocQGWNcshzV2RZVeZKi4OjIXckI/7
 CzgA==
X-Gm-Message-State: APjAAAU5ZM4723jq+iIXo/3LXlaBpi7gkTcSNZIv1+D6PC0hT09SKJes
 IoS75L4L+U09hUAhXWmdyZgst8TbyDHJpbUEX8ku2Q==
X-Google-Smtp-Source: APXvYqyxqu4JBgvOxCrc1nfUyRa7kvn2Bny/OFgNtiaE0k4Rb5EMUeO8+vo30q+iTNkeXvEr2noHrcnN4a7wExYB0As=
X-Received: by 2002:a2e:8156:: with SMTP id t22mr7772203ljg.77.1554490081449; 
 Fri, 05 Apr 2019 11:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJTE62-YTQ_3Kuii7T2z4-aOr5FrrOGF7WgxVnZaY6mu0XuPA@mail.gmail.com>
 <09129085-bbbe-79da-3b03-2e41c67eafac@gmail.com>
In-Reply-To: <09129085-bbbe-79da-3b03-2e41c67eafac@gmail.com>
From: Varun Priolkar <me@varunpriolkar.com>
Date: Sat, 6 Apr 2019 00:17:49 +0530
Message-ID: <CALwBDFsG5zJb_qLO4oLa6vH-U5QA=ACKFh7jOXtyE3Afd2xumg@mail.gmail.com>
Subject: Re: Server with multiple peers
To: Aaron Jones <aaronmdjones@gmail.com>
X-Mailman-Approved-At: Sat, 06 Apr 2019 13:51:23 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

If you really want to do something like this(I'm not sure why), don't
add the route via Wireguard. You can instead use iBGP multipath or
ECMP to do this.

On Fri, Apr 5, 2019 at 9:01 PM Aaron Jones <aaronmdjones@gmail.com> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> On 30/03/2019 00:45, Indro Fedrigo wrote:
> > Hi Jason, I'm trying to create a server with multiple peers form a
> > wgx.conf file : the parameter AllowedIPs seems to get set only for
> > the last peer... Any idea ? Thanks for this great piece of
> > software! Indro Fedrigo
>
> You cannot duplicate AllowedIPs. It forms WireGuard's internal routing
> table. You're essentially asking for "If we have traffic to
> 192.168/16, send it to peer A, and also to peer B, and also to peer C,
> and also to peer D".
>
> That doesn't work.
>
> - --
> Aaron Jones
>
> -----BEGIN PGP SIGNATURE-----
> Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/
>
> iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAlyndKEACgkQivBzdIir
> MBLnIRAAp3UURDFtevTlWUSwgKiVyzN9eT6MGtHi1owDOSVafWPoHJ+pM2PGkPj9
> v2aJsgeJK6cIC6j23F8G0ombgGsVaNFTVjeOLNThzgkv2DXJhgWjDu1iuyUmlAI6
> ZSuZ9ccd+OPa3YMGX9apGTeulvVjYGs06yJ5xpgCsqIMhCnj/XOS9HoWrGDWHqOA
> 3AZJK9/i3jIXQHYPSCpdXrppNCw8APQWgNuB1aDPdBMcw8bgARiJzWDF7Q2xBPxx
> SXS2PnFp9oG3+CNqGpEKnurUfx6QSGDPVps6a33HGpdTTAfyZw1Ha8ZSQgb3Yzt0
> U1JWxhLAF+o9ubkK0n9Q0jaunrDfDbbuPmvNF3ZAAkKmITsXPSieT0WB6kXk7l0K
> HZbyEexGLwrCTbLhublIazxQZsJe+ftz8liOrQr3/arGKS1NYItRV0nRKKVSR5Xx
> CsUV4Ngz2Wm+gFaET4QmEJJCARY+LNV+Ntrm+R+s+5vgGK1AJ4iRfR2vYt9dotje
> NiyHqF3FTFpqNK/tZ4CXgROniAmqJs5R4MRRqE5cgEsX8te5iDeCbtZPaAQepECj
> +tWhd10//pjr0G5PajPD8bzIWU2cgHT6JkqwA4l/ibR5EaJm7LQvS0ppUVzS6poy
> bbY0YILEtPSkDioZhxkZ3GTR2rAmE5lcGdW054CYDEdhfx9bYGo=
> =6Gmi
> -----END PGP SIGNATURE-----
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



-- 
Regards,

Varun Priolkar
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

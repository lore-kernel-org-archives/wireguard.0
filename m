Return-Path: <SRS0=6kAx=MR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD560C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 21:01:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C2E5213A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 21:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NuUnT9w+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C2E5213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e064495c;
	Fri, 5 Oct 2018 21:01:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd3f4403
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 21:01:24 +0000 (UTC)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bf5a495
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 21:01:24 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id q5-v6so8811673qki.6
 for <wireguard@lists.zx2c4.com>; Fri, 05 Oct 2018 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0pNP8YUm9+Y6h+a8QozHdJD2zjN86bTYIVM5z3NCPdc=;
 b=NuUnT9w+6UzrkvixzwggKzbqh8jvx7gn7IZ9OA7zfZ3EyPvsTw9jpmAO/Q9Xq5KldQ
 3/i48af7qjen+84bLBEbpze1tCG5a9sSB5GN8ccL5tZ/WOSKBxhfPUAkmejnm2HYcUoE
 njCKM1bHUO5ORFrUEH0dQ7+QCHW+Uy/S6I24s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=0pNP8YUm9+Y6h+a8QozHdJD2zjN86bTYIVM5z3NCPdc=;
 b=GzzebC2mrY077iT83qG3EbxCozFDKQBoCoSP/+u3m1pLFbUk2sd4X9GIiOn9RpU9cz
 wHT8oG8MFAkIcluv+ZoviJMBRt2ZJYuTbCTTCkkr8O3MaWZdpKjWFUdKwvsGBZ85SMxQ
 PNEy9UAhkP7rqPUG7bhok7rxaG+uTB9xF8df6orreiP/E52QPF1hcJpU+qeq382D3ubJ
 rUqYhHN0rGjai4cZy9VY9QEWsb72tMXczYOifBiMW530i3gm8yKwEUbWc/KxOqz5FnCa
 W4oHZx8VyWskG79ErdcOtyLzhlTTzGxr8P1VkxF43hx6mOCNbFZed/hypgySOvsiSp/3
 ++2Q==
X-Gm-Message-State: ABuFfoiiqNEl71YdTGsSMoHOSEJO8PQDxHtAfZduhqJzbdrhFQ5k8kOu
 ju+bgheSLDZLhaD8Rr+PW33lDg==
X-Google-Smtp-Source: ACcGV62f5NxEPKo3rF7xfhIIlAC4TinKeRTSiyGJmJ62FjLyFmu/Hx1eCl75G3TdV7VZeN95lOrSsw==
X-Received: by 2002:a37:9f85:: with SMTP id
 i127-v6mr10754492qke.113.1538773311289; 
 Fri, 05 Oct 2018 14:01:51 -0700 (PDT)
Received: from chatter ([184.75.214.131])
 by smtp.gmail.com with ESMTPSA id s52-v6sm5870367qts.5.2018.10.05.14.01.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Oct 2018 14:01:50 -0700 (PDT)
Date: Fri, 5 Oct 2018 17:01:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: Sending just ssh traffic via wg
Message-ID: <20181005210148.GA24357@chatter>
Mail-Followup-To: Matthias Urlichs <matthias@urlichs.de>,
 wireguard@lists.zx2c4.com
References: <20181004155359.GA5957@puremoods>
 <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
 <874le0d82v.fsf@toke.dk> <20181005155328.GB22501@puremoods>
 <81a33d58-8810-7f56-6193-ed6543a62915@urlichs.de>
MIME-Version: 1.0
In-Reply-To: <81a33d58-8810-7f56-6193-ed6543a62915@urlichs.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: multipart/mixed; boundary="===============5205776009487421183=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============5205776009487421183==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 05, 2018 at 06:32:44PM +0200, Matthias Urlichs wrote:
>On 05.10.18 17:53, Konstantin Ryabitsev wrote:
>> But should the admin need to bring up the OpenVPN link
>
>This may be a stupid question, but why do you need OpenVPN any more, if
>you have Wireguard?

Because it's already there? :)

Furthermore, some members of our IT team use macs (gasp!) and for them=20
it would be much easier to continue to use OpenVPN than to set up=20
wireguard-go.

>I'd set up a simple server-side login page that allows people to use
>their user+pass+TOTP to enable non-SSH traffic on "their" link for the
>next N minutes, with an easily-clickable Refresh button (and a
>browser-based notification that the timeout is imminent), plus a small
>(=3D easily-verified-to-be-correct) backend that enables/disables your
>link's iptables rules. Problem solved.

Well, not quite. OpenVPN requires 2-factor validation each time there is=20
a renegotiation -- so even if an attacker steals the private key and=20
username/password of the administrator, they won't be able to establish=20
a new session without having the TOTP secret as well. In the situation=20
you describe, we create a window during which an attacker *would* be=20
able to establish a VPN connection if they have the wireguard private=20
key. We can make this window very short, but this would probably greatly=20
annoy sysadmins, who will not enjoy needing to have a browser window=20
open so they can re-validate. If we make this window sufficiently long=20
not to annoy sysadmins, then this weakens our setup.

Furthermore, doing what you suggest would require writing a webapp and=20
having some kind of queueing system for the backend process to read and=20
adjust firewalls based on the data in the queue. It's a pretty=20
complicated setup that seems orthogonal to the simplicity offered by=20
WireGuard.

I've actually considered something like this -- to elevate their access=20
privileges, an admin would need to simply ssh into the wireguard vpn=20
server using their wireguard connection. A backend process could react=20
to the ssh session being established and would apply additional firewall=20
rules to give more access to that peer address. When that ssh session=20
terminates, the same process would then drop these firewall rules back=20
to their "ssh only" level. However, this still seems hacky and I would=20
rather wait for Jason to come up with a More Proper way to do 2-factor,=20
especially since the OpenVPN tunnel is already set up and functioning,=20
so I don't have to invent anything to get what we need.

-K

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCW7fROwAKCRC2xBzjVmSZ
bOLuAP4xebYn6zzzzrN4pusxy39mvgKr/k8gmtiv785xkezgGAEAvTBL35X91sOO
K04HXbsq02i6luZhilSO7SvL284+yA4=
=LNpz
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

--===============5205776009487421183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5205776009487421183==--

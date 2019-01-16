Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABF9C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 20:25:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD1520840
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 20:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0wU+CRv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD1520840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3295d1a;
	Wed, 16 Jan 2019 20:21:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 776d7dc3
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 20:21:29 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bfec5c4
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 20:21:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id y185so1924822wmd.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jan 2019 12:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Nc0f7yshq8qL7bBiTxa6BNXPeepMZMGghAxeryPIG40=;
 b=K0wU+CRvm3Qpb22Zpv27Gd6bQrx1PaaH1EsV6VgwbuAjlAf6m0GzPmTFvJkDeQ0HrT
 xu7IkGK9lKIaQ2OHdG1+nTsWGl29pH41SusLW9kevHeudQx1TZe39/b9fgrZkT1/CSc1
 vU2K1L9YfKlK+N6NH1AYhiLy8UsDU5QG04DGTGYxGqhNXIetKp4rg6+SIctxrwFeO+dY
 U75lJBszJnYgA5B2gXaU7e19vLEm5dA9MSQnQqnFh/B6/JAIdE8pMOJ0h9/qhzz7LWX7
 azyYrJIQ+MQWSRgffzbvLkX6JnXUDRTIpV+3EO8ke2PgLIWwWfAcySPvLxVt8sPsA3b+
 YT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Nc0f7yshq8qL7bBiTxa6BNXPeepMZMGghAxeryPIG40=;
 b=UYzAu66HfI1wde57tsxbQE/1ibe1952TxrUGE8P5y3olAxaXX4MU+pL2Iq4Tm42Lf/
 CrakT8OOvUMRm+Neet+tahM8WCxBh9/IqnLV2ecKqiACiZXqK6x1RlxogtQuYzxqU3IN
 xyvUJ/g8hXC4iTbVmPOiqUDa0GCu+Nbv389Ckh7iTBzBnyaRK78Y0tVuFFaEFSLnIe9J
 3MKOb/TBfZJtvBIO4VN3hK/U95cdJtKSREtDpalFAkNVHkTx6bpMJIdLVmYOIGRMSNEM
 01JZEoCxIcSQQgKgEPLr0OfqBX9+sJQ7kVvUj+W9AU4RM2ebIVmnTxuzLJsusatWxPSY
 XD1g==
X-Gm-Message-State: AJcUukcd2G+DnVRj5PF3mPiR1tvZpG5+TZXVBnLjOSRUlGvLw2BJYa4b
 WatKsPMIsAAMUUg9sGwPna0=
X-Google-Smtp-Source: ALg8bN6Nrk1d0AmMyAJgqzIC2QJJpaQslDTVCxhJuyubsJsXO+bk9DdWId3De4Pwt6X/Z3koasuWJA==
X-Received: by 2002:a1c:9a4c:: with SMTP id c73mr9271809wme.35.1547670339663; 
 Wed, 16 Jan 2019 12:25:39 -0800 (PST)
Received: from localhost (h082218219015.host.wavenet.at. [82.218.219.15])
 by smtp.gmail.com with ESMTPSA id s66sm30461807wmf.34.2019.01.16.12.25.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 12:25:38 -0800 (PST)
Date: Wed, 16 Jan 2019 21:25:37 +0100
From: Tharre <tharre3@gmail.com>
To: John Accoun <jsonacc@gmail.com>
Subject: Re: how would one go about building an admin frontend?
Message-ID: <20190116202537.GA4712@xultrabook.lan>
References: <CALLpx3RrfNM7Brf0m-9eEMbRiHneUWK00fNorUAn948asC6jSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALLpx3RrfNM7Brf0m-9eEMbRiHneUWK00fNorUAn948asC6jSg@mail.gmail.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
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
Content-Type: multipart/mixed; boundary="===============8409856015558030932=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8409856015558030932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/11, John Accoun wrote:
> I red the 'Web App provisioning Server' which I believe describes a
> possible solution for this use case. But I am confused with the whole data
> storage thing. Where do configuarations live? Are the configuration files
> at /etc/whireguard/ the source of truth? If I edit these when is the list
> of peers refreshed?

I assume you're referring to [0]?

/etc/wireguard is only relevant for wg-quick, if you edit files there
your changes will only take effect once you down/up your interface with
wg-quick.

So you obviously don't want to do it that way.

> The above mentioned document suggests shelling out to command line tools.
> Is this the recommended way. Does a general purpose library for managing
> wireguard config exist?

I'm not sure where you read that? In any case, you can control wireguard
via netlink[1], and there is also a embeddable library[2] in C
available.

There also probably exists a netlink library for $YOUR_FAVORITE_LANG.

Regards,
Tharre

[0] https://docs.google.com/document/d/1_3Id-0vVXlXHFB7eT6fnfXoe9ppJoS8pY7R=
_uCtEZG4
[1] See man 7 rtnetlink
[2] https://git.zx2c4.com/WireGuard/tree/contrib/examples/embeddable-wg-lib=
rary/wireguard.c

--=20
PGP fingerprint: 42CE 7698 D6A0 6129 AA16  EF5C 5431 BDE2 C8F0 B2F4

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEsuhqARgBY035sVClY1a5mXdUZMYFAlw/kz4ACgkQY1a5mXdU
ZMbVGAf+IG0tkei4MshxpB76RJ2Rd5BrlUfNJ00mIPPuYzQp3zV1IaC4HFRBXcc7
CvGck3RoXGdKnBxTbr4os8HuTJtTQEAW3bVkpA8N2HDVcL0ZScug/MYP86hhG8+i
FYdy4XvpF8+pbYPwBNUkoDGcncsgQZqLvIdX7hpfH0UehGm20K8YDf7to/16LG0y
3pFxlcHVndGrKlc2giyeR+f24Pu1ZsQb+uxJvVuB7B1jTfa0QfFeB2k35fUgO/dL
xVYC+VeVhGO8l0vIWEHPp4QSbCY3f0yZh66BsFcZBHnnyAFtOmVWYdx0LRRKBWB6
DdFxl7lG4cNBwXYbt3/zfWzOCIb6TQ==
=JsCW
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--

--===============8409856015558030932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8409856015558030932==--

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FA0C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Feb 2023 11:37:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34050873;
	Mon, 20 Feb 2023 11:37:55 +0000 (UTC)
Received: from a3i216.smtp2go.com (a3i216.smtp2go.com [203.31.36.216])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 393d29a3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 18:41:44 +0000 (UTC)
Received: from [10.68.162.240] (helo=smtpclient.apple)
 by smtpcorp.com with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256) (Exim 4.96-S2G)
 (envelope-from <karog@jgibbons.com>) id 1pTod3-Ibk3Vy-1t;
 Sun, 19 Feb 2023 18:41:41 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2] Allow config to read secret keys from file
From: karog <karog@jgibbons.com>
In-Reply-To: <20230219182357.444395-1-dxld@darkboxed.org>
Date: Sun, 19 Feb 2023 13:41:27 -0500
Cc: wireguard@lists.zx2c4.com, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0EB0C3F5-AB25-4E14-9390-7FE24CAD7BB8@jgibbons.com>
References: <20230219182357.444395-1-dxld@darkboxed.org>
To: =?utf-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Feedback-ID: 390576m:390576aPfCV0U:390576s5Ejb87OJR
X-smtpcorp-track: 1pTod3mPk3Vy1t.8q1n95MVT6XM7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1676832102; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=xSME+wocQeflRZ3hU6JzO5niGQY7nh6yDajs/scT4sQ=;
 b=syUPrRWTcDh7uzDSCEqYbF5xdh/GfZAnGtI98SmI5vVmcA4aGMbKi90g2aZLygmY5vJD2
 o2HpVTz5NTYTKxSvXdOC2Z5ABive74IxTQ80BhdsjlrTKMyrgF1fPVImgCBR+Jxsi79EsS7
 CLoYp4irEV1/7ltIGk3JEItTJm4vVM3qJGjNCDOHuW5iSJAMjWP1AtciRqOay1bxx2oioC6
 PDCYsfbMgd+lTD4whUmii8QO49XGRQAv6Br7qObJGKLRL+nRqFfaHKUwFq0kXTWosRPE69Y
 u/h21nGdaQQkLF8V8pAxWPR2wftI/rpy8B5rDn+BN9sECm4FsEVDlvZFioig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jgibbons.com;
 i=@jgibbons.com; q=dns/txt; s=s390576; t=1676832102; h=from : subject
 : to : message-id : date;
 bh=xSME+wocQeflRZ3hU6JzO5niGQY7nh6yDajs/scT4sQ=;
 b=aDrvBtQDqqIsJ7xb5iOG3Y8qeBAxqNN+Sp6PLttAacEZj2N6OQnuFLQYKXsxGGmCupR98
 h9Cf0OIA4vvX9g6BHPj0a8N5aC+0vQVS31/l7bwC3mX/BLkGgRWGHAj84eRf5NCRQibcvyG
 4eXQYmYPIQ++HZJX3dgBgbPLm4WnJDnyW2F+q+XUIJNx+OPfgcfGsvWCGOozTLQHkheEKmY
 l8IoIpqMfFPxLwmtywCXYXl04M2MZr0x5thX67+Bxgj6L4lD/ZcMK9FpFvpwSJ/VJWVo5Ce
 HWdTbBf/qPj7e68xrcjiIKLThYQXM2OMEp/epNfgxnf9DhMPBVkjcxHOInYA==
X-Mailman-Approved-At: Mon, 20 Feb 2023 11:37:48 +0000
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

Instead of using new config keys, did you consider using special values =
for this case like

PrivateKey=3Dfile:/path/to/key
PresharedKey=3Dfile:/path/to/preshared

In addition to not proliferating new config keys, it also prevents the =
possibility of erring by including both PrivateKey and PrivateKeyFile

This kind of syntax is used in systemd service files for things like =
StandardOut and StandardError

karog

> On Feb 19, 2023, at 1:23 PM, Daniel Gr=C3=B6ber <dxld@darkboxed.org> =
wrote:
>=20
> This adds two new config keys PrivateKeyFile=3D and PresharedKeyFile=3D =
that
> simply hook up the existing code for the `wg set ... private-key =
/file`
> codepath.
>=20
> By using the new options wireguard configs can become a lot easier to
> manage and deploy as we don't have to treat them as secrets anymore. =
This
> way they can, for example, be tracked in public git repos while the =
secret
> keys can be provisioned using an out of band system or with a manual
> one-time step instead.
>=20
> Before this patch we were using an ugly hack: it's possible to simply =
omit
> PrivateKey=3D and set it using `PostUp =3D wg set %i private-key =
/some/file`.
> However this breaks when we try to use setconf or synconf as they
> will (rightly) unset the private key when it's missing in the =
underlying
> config file breaking connectivity.
>=20
> Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>
> Signed-off-by: Daniel Gr=C3=B6ber <dxld@darkboxed.org>
> ---
> src/config.c | 8 ++++++++
> src/man/wg.8 | 4 ++++
> 2 files changed, 12 insertions(+)
>=20
> diff --git a/src/config.c b/src/config.c
> index e8db900..f9980fe 100644
> --- a/src/config.c
> +++ b/src/config.c
> @@ -464,6 +464,10 @@ static bool process_line(struct config_ctx *ctx, =
const char *line)
> 			ret =3D parse_key(ctx->device->private_key, =
value);
> 			if (ret)
> 				ctx->device->flags |=3D =
WGDEVICE_HAS_PRIVATE_KEY;
> +		} else if (key_match("PrivateKeyFile")) {
> +			ret =3D parse_keyfile(ctx->device->private_key, =
value);
> +			if (ret)
> +				ctx->device->flags |=3D =
WGDEVICE_HAS_PRIVATE_KEY;
> 		} else
> 			goto error;
> 	} else if (ctx->is_peer_section) {
> @@ -483,6 +487,10 @@ static bool process_line(struct config_ctx *ctx, =
const char *line)
> 			ret =3D parse_key(ctx->last_peer->preshared_key, =
value);
> 			if (ret)
> 				ctx->last_peer->flags |=3D =
WGPEER_HAS_PRESHARED_KEY;
> +		} else if (key_match("PresharedKeyFile")) {
> +			ret =3D =
parse_keyfile(ctx->last_peer->preshared_key, value);
> +			if (ret)
> +				ctx->last_peer->flags |=3D =
WGPEER_HAS_PRESHARED_KEY;
> 		} else
> 			goto error;
> 	} else
> diff --git a/src/man/wg.8 b/src/man/wg.8
> index fd9fde7..48f084d 100644
> --- a/src/man/wg.8
> +++ b/src/man/wg.8
> @@ -134,6 +134,8 @@ The \fIInterface\fP section may contain the =
following fields:
> .IP \(bu
> PrivateKey \(em a base64 private key generated by \fIwg genkey\fP. =
Required.
> .IP \(bu
> +PrivateKeyFile \(em path to a file containing a base64 private key. =
May be used instead of \fIPrivateKey\fP. Optional.
> +.IP \(bu
> ListenPort \(em a 16-bit port for listening. Optional; if not =
specified, chosen
> randomly.
> .IP \(bu
> @@ -151,6 +153,8 @@ and may be omitted. This option adds an additional =
layer of symmetric-key
> cryptography to be mixed into the already existing public-key =
cryptography,
> for post-quantum resistance.
> .IP \(bu
> +PresharedKeyFile \(em path to a file containing a base64 preshared =
key. May be used instead of \fIPresharedKey\fP. Optional.
> +.IP \(bu
> AllowedIPs \(em a comma-separated list of IP (v4 or v6) addresses with
> CIDR masks from which incoming traffic for this peer is allowed and to
> which outgoing traffic for this peer is directed. The catch-all
> --=20
> 2.30.2


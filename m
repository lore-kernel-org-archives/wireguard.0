Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EB2F531CE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Apr 2026 21:43:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5c523db3;
	Mon, 13 Apr 2026 21:41:19 +0000 (UTC)
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id eb28984a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Apr 2026 21:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1776116476; x=1776375676;
 bh=MLY76jV9HjUHBrnmVXOoRdLTCznaBwKdzg1pSohvQLs=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=M/s8CFbsCxQUjL65lm33LhdM8JiVf16D6s+OVlc2J+CSZlgjTNynqB6/GhQF2YMmI
 zXNtfwAyFJ+Xnp+/zRuIMkoGbAlyfLu6tejr/HuyZIkwsmjMZrgawkUuBJz3IslWOi
 mSzcqoNdkHun6viSQhIw4I4hqhuLcBMpwkplnHfFepW3zmxSNLLEyWKo/El4j1rlPT
 QOdX/VZiAVBKd7lfRKXA7KuvZQAU3pAZ8hqfkh3UQ92daQEagTBdm4QE7uXGsAYpnV
 NinZi8bC1Rx0K7doy086YKwh0xQVPbusSyo8I1CxMgIMHlDedTPnxZE13rwGCluZaR
 SG4MLZ5LwvXiA==
Date: Mon, 13 Apr 2026 21:41:11 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Douglas Silva <doug.hs@proton.me>
Subject: Re: Android app: export configuration as a password-protected zip file
Message-ID: <5OnExJASKzYVA1fiNjP_WBN5i5seMIJpGVOZrdCItPeaYKrmNr4Wist_6oHN8eYSDBM2JzSd7DooSQH4faJ4kt9ySoDMSZlmFRokIMPKJ04=@proton.me>
In-Reply-To: <3uPzijiGmCFwzmGThO2Z2EhiLTEw1w-Jqx3eC5wTpEjGUfbAivno4-eIG9UV4Xqc9tUFSdKkobsWPYRBke-QuqkqGwylaPy4-ALihwtoe7Y=@proton.me>
References: <3uPzijiGmCFwzmGThO2Z2EhiLTEw1w-Jqx3eC5wTpEjGUfbAivno4-eIG9UV4Xqc9tUFSdKkobsWPYRBke-QuqkqGwylaPy4-ALihwtoe7Y=@proton.me>
Feedback-ID: 47597204:user:proton
X-Pm-Message-ID: 793ca4b15a5924c1c27444b754e877b7dbc5e146
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

An update: it seems that Seedvault can already backup this app's data, beca=
use it pretends to do a device-to-device transfer. [1]

That's good enough for those running the likes of LineageOS, but I still th=
ink the password-protected zip would still be useful in case you don't like=
 to use Auto Backup.


[1] https://github.com/seedvault-app/seedvault/discussions/997#discussionco=
mment-16437606



On Saturday, August 9th, 2025 at 09:08, Douglas Silva <doug.hs@proton.me> w=
rote:

> Greetings.
>=20
> This is a feature request for the Android app. I'd like to suggest two al=
ternatives to address the issue of exporting an unencrypted zip-file contai=
ning all your private keys into the Downloads folder.
>=20
> 1. Export a password-protected zip-file instead, allowing us to choose a =
password in the app settings. This is what Syncthing does nowadays.
>=20
> 2. Optionally let Android Backup pick up our config (disabled by default)=
. Google Drive isn't the only back-end available. Ever heard of Seedvault? =
It's the default on systems like LineageOS or CalyxOS. Seedvault does encry=
pted backups to any location; even offline, to a flash stick. Aegis Authent=
icator uses it, as long as the backup is advertised as encrypted. See [1], =
[2] and [3] and [4].
>=20
> [1] https://developer.android.com/identity/data/autobackup#EnablingAutoBa=
ckup
> [2] https://developer.android.com/identity/data/autobackup#define-device-=
conditions
> [3] https://github.com/seedvault-app/seedvault/wiki/FAQ#why-do-some-apps-=
not-allow-to-get-backed-up
> [4] https://github.com/beemdevelopment/Aegis/blob/master/app/src/main/And=
roidManifest.xml#L22
>=20
>=20
> For option 1 (password-protected zip), I'd also like to suggest the addit=
ion of (optional) automatic exports to a chosen folder, to facilitate autom=
atic backups with an external tool such as Syncthing. The messaging app Sig=
nal does something like this to export your messages (encrypted) and keep t=
he last five versions of it.
>=20
> Thank you.

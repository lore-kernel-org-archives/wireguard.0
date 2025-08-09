Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD90C87FCF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Aug 2025 12:08:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8a6e26f;
	Sat, 9 Aug 2025 12:08:25 +0000 (UTC)
Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch
 [109.224.244.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5d308fa6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Aug 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1754741302; x=1755000502;
 bh=yKAmII95noHMFjEu4/L+dLZBoSYAJoyZm6yOf54eAzI=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=jKthocJUiYp7VESdv4yWDjJovspchQgYLRLg6OjdzGc7WuAhAWznPIQ5B5gCzW1NA
 Yt5cMnJLPFn0U5RFzEVHpWsP/A6RJNjUKljnvvDf3bDYd8oAu7A6ykRnYiBFAUpzsk
 IrdwQX4zu5KUy3fAKBSlo87MyU3VzRzFAPxyvLroeSQKUSR7IGrljzsPg0x9qruWPW
 ppkQrw8Jyiv1u0kwbZ6wORZCo3lx0p2SNmBzUC4+AduqmiSuJRItsyColmy3ko4adO
 U1vNq7JzWbD1qL52kvvq8cdMpbMu3sRCIwuSTMgcryJJ/zjtOzyBwq7aKsixbsTv26
 xn2guSeryKCtQ==
Date: Sat, 09 Aug 2025 12:08:17 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Douglas Silva <doug.hs@proton.me>
Subject: Android app: export configuration as a password-protected zip file
Message-ID: <3uPzijiGmCFwzmGThO2Z2EhiLTEw1w-Jqx3eC5wTpEjGUfbAivno4-eIG9UV4Xqc9tUFSdKkobsWPYRBke-QuqkqGwylaPy4-ALihwtoe7Y=@proton.me>
Feedback-ID: 47597204:user:proton
X-Pm-Message-ID: 8d8bcf68c0a91c5413cd8de33b44d49fd93722cf
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_Z5L8KQAFMdw4CJD8SsdltaLiORfUrcSUGCXCpjpqL0"
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

--b1=_Z5L8KQAFMdw4CJD8SsdltaLiORfUrcSUGCXCpjpqL0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Greetings.

This is a feature request for the Android app. I'd like to suggest two alte=
rnatives to address the issue of exporting an unencrypted zip-file containi=
ng all your private keys into the Downloads folder.

1. Export a password-protected zip-file instead, allowing us to choose a pa=
ssword in the app settings. This is what Syncthing does nowadays.

2. Optionally let Android Backup pick up our config (disabled by default). =
Google Drive isn't the only back-end available. Ever heard of Seedvault? It=
's the default on systems like LineageOS or CalyxOS. Seedvault does encrypt=
ed backups to any location; even offline, to a flash stick. Aegis Authentic=
ator uses it, as long as the backup is advertised as encrypted. See [1], [2=
] and [3] and [4].

[1] https://developer.android.com/identity/data/autobackup#EnablingAutoBack=
up
[2] https://developer.android.com/identity/data/autobackup#define-device-co=
nditions
[3] https://github.com/seedvault-app/seedvault/wiki/FAQ#why-do-some-apps-no=
t-allow-to-get-backed-up
[4] https://github.com/beemdevelopment/Aegis/blob/master/app/src/main/Andro=
idManifest.xml#L22


For option 1 (password-protected zip), I'd also like to suggest the additio=
n of (optional) automatic exports to a chosen folder, to facilitate automat=
ic backups with an external tool such as Syncthing. The messaging app Signa=
l does something like this to export your messages (encrypted) and keep the=
 last five versions of it.

Thank you.
--b1=_Z5L8KQAFMdw4CJD8SsdltaLiORfUrcSUGCXCpjpqL0
Content-Type: application/pgp-keys; name="publickey - doug.hs@proton.me - 0xB577E0C1.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - doug.hs@proton.me - 0xB577E0C1.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWW5aNHV4WUpLd1lCQkFI
YVJ3OEJBUWRBZzR4UHM5YnFXcGNXY3ZHNm5PTktHQTNOS1JWN3c4YlcKQ3BqQmlOalkvVkxOSldS
dmRXY3VhSE5BY0hKdmRHOXVMbTFsSUR4a2IzVm5MbWh6UUhCeWIzUnZiaTV0ClpUN0Nqd1FRRmdv
QUlBVUNZblo0dXdZTENRY0lBd0lFRlFnS0FnUVdBZ0VBQWhrQkFoc0RBaDRCQUNFSgpFSzNVMlBG
Q0svMjRGaUVFdFhmZ3dUTURpWHc4MGlDTXJkVFk4VUlyL2JoanpRRUFzM1VkL0NRU1pIL3cKdVVZ
OGc3NVVxMTM0U1ZpZ3Z0cEY2cmttYnNWYW5QMEJBSW9McG9HSGJ4REtMcmxQZHJMd3RoWitqakhK
Cm1JaE9WZjZxeGJGTjdKSUF6amdFWW5aNHV4SUtLd1lCQkFHWFZRRUZBUUVIUUU4VmhYRkxPRWFN
YUUzWApIYVU1TGt1T2lWWUIxeGZOUmNHRFQ1elJzbmRVQXdFSUI4SjRCQmdXQ0FBSkJRSmlkbmk3
QWhzTUFDRUoKRUszVTJQRkNLLzI0RmlFRXRYZmd3VE1EaVh3ODBpQ01yZFRZOFVJci9iajZWd0VB
MTZIQ3JQblJzUGxECllMNFVtTmNFWFF5K0hiUDlvY0huNGFjUG9jeVVwY0lBL2ljVzBaZGNKUmt2
b3BLWnM2MVdMWFZtWE1Tdgo4dFk1azZkemtwZkwxOUlFCj1IcDEzCi0tLS0tRU5EIFBHUCBQVUJM
SUMgS0VZIEJMT0NLLS0tLS0K

--b1=_Z5L8KQAFMdw4CJD8SsdltaLiORfUrcSUGCXCpjpqL0--


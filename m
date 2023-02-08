Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459A4C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Feb 2023 02:22:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ce8e28c;
	Wed, 8 Feb 2023 02:19:49 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9645e51
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 02:19:48 +0000 (UTC)
Date: Wed, 08 Feb 2023 02:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1675822788; x=1676081988;
 bh=PG1zfNKa8XzvJF0bA1tLHGAToyetVWrwMM7qYCrqy1g=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=oBH/GF082bho2D+N+PMc+QgTbijWw9JyLBU/z/Be8on9vwKTSEJVXZcZ05Qmi69Fp
 INNI0Uf2yfUDGHGmhDzjgFaeM77T0tJL12p+u5Wwq/fo5Zi+z3QMFKIWi1NPRIjnsi
 QqU1E+1hE8fAL0WPWQTB+Wdix+uKE7TAmJ1RH70jqlULAS/NBLowncXjDkcTNJhLMl
 iKro6h+W6Nn48Fw2tTMBI6Z9M7tW1mls7oAvxRmoCXTGERF8eRR+VXSEPTYE4Q4Zi5
 WUH7ecK/lY/952aZGbqgMGdrjuO8L5r6WGVOTSfk9tAniOawv3XZMT0xa7DRXvCW2Y
 FRY4d+Dejxb1Q==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: David Cowden <dcow@pm.me>
Cc: Nazar Mokrynskyi <nazar@mokrynskyi.com>, wireguard@lists.zx2c4.com
Subject: Re: Allow client-side encrypted backups for Android app
Message-ID: <7SV3pRtTQ0fygsJjyhdMRte9uso_M0G_jTfDeqnELBrym4Z_3NeGeIvgNYpEdXttpmafNk_A2NqH26O6VF_8pgrXjzUOmrCVPehRX7Iu_eE=@pm.me>
In-Reply-To: <CAHmME9oBexy2JahGPbbgxHBcuiGdc1u4JeCoxtYDRPJkJWZ55w@mail.gmail.com>
References: <5e029a99-a860-0ae0-be72-df53cf82d0ce@mokrynskyi.com>
 <CAHmME9oBexy2JahGPbbgxHBcuiGdc1u4JeCoxtYDRPJkJWZ55w@mail.gmail.com>
Feedback-ID: 9064091:user:proton
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

On Android 12+ you can configure which files are backed up (among other thi=
ngs) at runtime using the BackupAgent API https://developer.android.com/gui=
de/topics/data/autobackup. Would you be opposed to this being a configurabl=
e option that defaults to off?

David

------- Original Message -------
On Tuesday, February 7th, 2023 at 7:03 PM, Jason A. Donenfeld <Jason@zx2c4.=
com> wrote:


>=20
>=20
> I think I'd prefer to still keep this a bit more locked down. There is
> the "export tunnels as zip" feature (which requires an explicit
> authentication step each time), which you can use for backup/restore.
>=20
> Jason

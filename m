Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CCDC05027
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Feb 2023 12:41:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97c1c547;
	Wed, 8 Feb 2023 12:38:19 +0000 (UTC)
Received: from mail.mokrynskyi.com (mail.mokrynskyi.com [46.4.12.50])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c05c0613
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Feb 2023 12:38:18 +0000 (UTC)
Message-ID: <e9f33d60-4553-0795-16d8-83b54b7822d0@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
 s=dkim; t=1675859897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fy0jVKSWV1n6s0EOcW0uDjLs6gIxc7D0MNutCMICR4M=;
 b=Kzg18/aO939fNSehy4I7tX99IxxqOmAV2ktoMrJ47d2bpUSz+0iss8zq/Pr9VG95q9JTO9
 mFnC5H2DEAPTAQ/ZcoUYkuXvcXARgWfJqlkl0rmx7q7y6icIPSLDLGIRkQCOGd3Ejuy0PN
 FtohtJCkCuruGVps4TOCYSJbJk1DgRFl1qrI7DKXYYPxg6QGyowhc6MuU1NMmjWyBnDsAC
 uYJoPIVMy8K75AAonoyaNan5kITsj2pdySgg/Zs6llLEq3+7gfatU4Z0JsAiBZaIN/GNn+
 pAj9htIJu1tZ4Gv0gFROIkEwSq89zRoyGSsBUloC/FC4DG9oHQaNre0+g/aqJw==
Date: Wed, 8 Feb 2023 14:38:16 +0200
MIME-Version: 1.0
Content-Language: ru, en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, David Cowden <dcow@pm.me>
References: <5e029a99-a860-0ae0-be72-df53cf82d0ce@mokrynskyi.com>
 <CAHmME9oBexy2JahGPbbgxHBcuiGdc1u4JeCoxtYDRPJkJWZ55w@mail.gmail.com>
 <7SV3pRtTQ0fygsJjyhdMRte9uso_M0G_jTfDeqnELBrym4Z_3NeGeIvgNYpEdXttpmafNk_A2NqH26O6VF_8pgrXjzUOmrCVPehRX7Iu_eE=@pm.me>
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Re: Allow client-side encrypted backups for Android app
In-Reply-To: <7SV3pRtTQ0fygsJjyhdMRte9uso_M0G_jTfDeqnELBrym4Z_3NeGeIvgNYpEdXttpmafNk_A2NqH26O6VF_8pgrXjzUOmrCVPehRX7Iu_eE=@pm.me>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0p4hpRULpgm9vWSHYigiRZJn"
Authentication-Results: mail.mokrynskyi.com;
 auth=pass smtp.mailfrom=nazar@mokrynskyi.com
X-Spamd-Bar: --
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0p4hpRULpgm9vWSHYigiRZJn
Content-Type: multipart/mixed; boundary="------------c00pEpSaF2E60XtCivh44zww";
 protected-headers="v1"
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, David Cowden <dcow@pm.me>
Message-ID: <e9f33d60-4553-0795-16d8-83b54b7822d0@mokrynskyi.com>
Subject: Re: Allow client-side encrypted backups for Android app
References: <5e029a99-a860-0ae0-be72-df53cf82d0ce@mokrynskyi.com>
 <CAHmME9oBexy2JahGPbbgxHBcuiGdc1u4JeCoxtYDRPJkJWZ55w@mail.gmail.com>
 <7SV3pRtTQ0fygsJjyhdMRte9uso_M0G_jTfDeqnELBrym4Z_3NeGeIvgNYpEdXttpmafNk_A2NqH26O6VF_8pgrXjzUOmrCVPehRX7Iu_eE=@pm.me>
In-Reply-To: <7SV3pRtTQ0fygsJjyhdMRte9uso_M0G_jTfDeqnELBrym4Z_3NeGeIvgNYpEdXttpmafNk_A2NqH26O6VF_8pgrXjzUOmrCVPehRX7Iu_eE=@pm.me>

--------------c00pEpSaF2E60XtCivh44zww
Content-Type: multipart/mixed; boundary="------------zwmV70DpWJ1As0DzCpvA01If"

--------------zwmV70DpWJ1As0DzCpvA01If
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I know there is an export feature in the app and I used it successfully, =
but it doesn't make much sense to me to have that and disable OS backups =
at the same time.
There are use cases for one-off copying of things for which exporting as =
zip is great, but there are also others.

I don't want to have set a reminder and regularly go though every single =
app manually, use their flavor of backup feature (that doesn't necessaril=
y store everything BTW, including in Wireguard), then collect the files s=
omehow, encrypt them and send to the destination.

What I want is automation: configure the tool (SeedVault in my case) to c=
reate backups of all apps every day and store them in encrypted form on m=
y private Nextcloud instance with ability to restore backups easily later=
 on.
The issue is that some apps like Wireguard prevent me from enjoying that =
workflow fully and right now I don't see why would it be beneficial for W=
ireguard to intentionally prevent that.

With that context I hope it is clearer why I'd appreciate for current des=
ign decision around that to be re-evaluated.

Sincerely, Nazar Mokrynskyi
github.com/nazar-pc

08.02.23 04:19, David Cowden =D0=BF=D0=B8=D1=88=D0=B5:
> On Android 12+ you can configure which files are backed up (among other=
 things) at runtime using the BackupAgent API https://developer.android.c=
om/guide/topics/data/autobackup. Would you be opposed to this being a con=
figurable option that defaults to off?
>
> David
>
> ------- Original Message -------
> On Tuesday, February 7th, 2023 at 7:03 PM, Jason A. Donenfeld <Jason@zx=
2c4.com> wrote:
>
>
>>
>> I think I'd prefer to still keep this a bit more locked down. There is=

>> the "export tunnels as zip" feature (which requires an explicit
>> authentication step each time), which you can use for backup/restore.
>>
>> Jason
--------------zwmV70DpWJ1As0DzCpvA01If
Content-Type: application/pgp-keys; name="OpenPGP_0x8CF6D73DB34AAFEA.asc"
Content-Disposition: attachment; filename="OpenPGP_0x8CF6D73DB34AAFEA.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DOe+F
-----END PGP PUBLIC KEY BLOCK-----

--------------zwmV70DpWJ1As0DzCpvA01If--

--------------c00pEpSaF2E60XtCivh44zww--

--------------0p4hpRULpgm9vWSHYigiRZJn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEERsBQp7B9wt91PKHZjPbXPbNKr+oFAmPjl7gFAwAAAAAACgkQjPbXPbNKr+oy
8Q//SPh+gyVveT+2XY2WSNgHVvZValucLIlcBpFoOexnvSMVRm5SYuexlTCDGqGh8H4Oyu2WKkOs
5wE7i32lNpo3Amdpb9j7pUP23kwkOGhvKRGTqt9FuAFkAwWT3V1Jn+ff0q64FlT/VBM7i6wzu58h
8iPmspgqInKGtuJqJxuxeCA1FkbT5DWZe26UZyyAo6hsme44LYaJXvcTejlOawk2zd2INThPs1br
4N8C0fgZAHGO2A7I8iL/7Fb9BNDllw6Jeip3ndR9cZOHUgb7RtByCFBKnHPm347IWXncep/RHyA+
OjdbVAJ+4R1DqePvLYiQ2hTr7s7kfayFPxblYuvN9ZvAughz2sd1daV9VGOXSn8hWFKIV7UhA5R9
WyP1CFhN+N5XZLQJjDMqB9RyJ1vvft+lhIAnryvdY/B/RMwMe8I0CUDLvC3K2NxXX0mlOa9PJyah
IYoyQIdFz+2Q9F5gTCCGAQW+e9la9P80fn2W55R6ASstPvwO1OKbxAB+Fr71Qd9LacMuT7jS36zC
WtkzT17sm4U2VR4Bk/ITs8aNrddsxZGUJO1mjXoAJCSs7/42cHVrUgy0exXUjdew8+1ouON6+rwg
0G2/Euq2EjhbCoZX2OV4Hwq0SiHydROPVJFAETmXFYVpmxA0EdRfrpszAN1/oLWohebd0NBfuNW+
LEg=
=7ll1
-----END PGP SIGNATURE-----

--------------0p4hpRULpgm9vWSHYigiRZJn--

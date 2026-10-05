Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C615CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 12:51:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b2629107;
	Mon, 5 Oct 2026 12:13:14 +0000 (UTC)
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 853ce8e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Oct 2026 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=lolgistvurhtfnhcwytydatpj4.protonmail2; t=1791202387;
 x=1791461587; bh=ZCtJO+q42KYoNs4xrfVgvNscKdzZmZj/Nd49PSEJ6Oo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=sDhM4ckFFH1gOcUtO0aOA1EMaMh4WLgt/RIClOUcOj709Bh2NHzZzdAqSyN8/LCBN
 9bQ1iX1ThEs4ztnZn6foIJNw7VgRXqoKGTr1yMgDR+xNDxuq1JhLkxk83vtvSkcRrJ
 Hjba3FFkZCwJz390QkFV9ZVk2Jas1ylKFrK+IJRVxDThpiFuNVZQdbNM8mRwHXvZDg
 MpqsxBEBE7uyBzHjH+8oZDydO3lOESlI/fkTjyz2GzRVjNm2DwbxFQgDOhHDZaWRkE
 ZXQsSl/KmeY5PhDwXm+xVOBj8/kgmMOfhDvsdLEFGXSfE87AFiB3rzAxiHyVE6o7vg
 XNfgS3OFg0Ufw==
Date: Mon, 05 Oct 2026 12:13:02 +0000
To: netdev-bot+sashiko@kernel.org
From: quantumvoid0 <quantumvoid0@proton.me>
Cc: wireguard@lists.zx2c4.com, Jason@zx2c4.com, netdev@vger.kernel.org,
 kuba@kernel.org
Subject: Re: [PATCH] wireguard: allowedips: prevent stack overflow without
 DEBUG
Message-ID: <9NzB3VmT-7cBBfdx9sREmRkFb_gOAmI78VheKlX2Mdiqjl3B3N0OCZ5DT8C1SpEJuM5O3TzLltSpGh9ptxni28Lnq4ATz8u86R-f-jdcKPE=@proton.me>
In-Reply-To: <179117435281.434549.17747961185403870914@kernel.org>
References: <TaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4Xtksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ=@proton.me>
 <179117435281.434549.17747961185403870914@kernel.org>
Feedback-ID: 175132216:user:proton
X-Pm-Message-ID: eeb04b2d92f3424090027273ca57fb8dd7819688
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

Thanks, both points are valid.

Medium is correct, not reachable in tree. cidr strictly increases
along root->leaf so depth <=3D129, DFS stack stays <=3D129. This is
hardening only so a future bug cant smash stack[129] in production
where WARN_ON(DEBUG && ...) compiles out. Ill reword v2 to say
hardening, no Fixes: tag.

Low is correct; author/Sob name mismatch. Will fix to match in v2.

pw-bot: cr


On Monday, October 5th, 2026 at 4:25 AM, netdev-bot+sashiko@kernel.org <net=
dev-bot+sashiko@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>=20
> - [Medium] The commit message says production builds have "an unchecked
>   stack[129] write" in push_rcu() (drivers/net/wireguard/allowedips.c),=
=E2=80=A6
> - [Low] The commit author is 'quantumvoid <quantumvoid0@proton.me>' but
>   the Signed-off-by trailer says 'quantumvoid0 <quantumvoid0@proton.me>'.
>=20
> --
>=20
> wireguard: allowedips: prevent stack overflow without DEBUG
>=20
> This commit changes push_rcu() so that the len >=3D MAX_ALLOWEDIPS_DEPTH
> check is always evaluated and only the WARN is gated on DEBUG. The commit
> message presents this as a fix for an unchecked stack[129] write in
> production builds.
>=20
> > push_rcu() only bounds-checked the traversal stack when
> > DEBUG is defined. In production the check is compiled out,
> > leaving an unchecked stack[129] write.
>=20
> [Severity: Medium]
> Is the stack[129] write actually reachable in the current tree? The trie
> invariants seem to rule it out.
>=20
> add() rejects a cidr larger than the address width:
>=20
>     if (unlikely(cidr > bits || !peer))
>         return -EINVAL;
>=20
> On an exact prefix match, node_placement() reuses the existing node. When
> a node is split, it gets this cidr:
>=20
>     cidr =3D min(cidr, common_bits(down, key, bits));
>=20
> That value is greater than the parent's cidr and smaller than the
> children's cidr. So cidr strictly increases along every root-to-leaf path=
,
> and a node with cidr =3D=3D bits has no children. That caps any path at 1=
29
> nodes.
>=20
> root_free_rcu() and root_remove_peer_lists() pop one node before pushing
> at most two children. While a node at depth d is being handled, the stack
> holds at most d + 2 <=3D 129 entries. A push with *len =3D=3D 129 never h=
appens,
> so stack[129] is never written.
>=20
> The DEBUG-only gating also looks deliberate. The selftest in
> drivers/net/wireguard/selftest/allowedips.c builds a maximal-depth trie t=
o
> exercise this assertion. Commit 46622219aae2 ("wireguard: allowedips:
> expand maximum node depth") sized the array to 129 for this reason and
> fixed the real off-by-one there.
>=20
> Could the commit message call this hardening of a debug-only invariant
> check? The other option is to show a path that breaks the depth invariant=
.
> As written, it reads as a fix for a reachable stack overflow, with no
> trigger and no Fixes: tag.
>=20
> > Signed-off-by: quantumvoid0 <quantumvoid0@proton.me>
>=20
> [Severity: Low]
> This isn't a bug, but the name in the Signed-off-by (quantumvoid0) does
> not match the Author name (quantumvoid), even though the email is the
> same. checkpatch.pl warns about this mismatch. Could the two be made
> consistent?
>=20
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/TaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4Xtksw07sYrIpludwvJQru=
kFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ%3D%40proton.me
> 

Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A45C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Nov 2021 14:42:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE466120A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Nov 2021 14:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BE466120A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4407ddf2;
	Fri, 5 Nov 2021 14:42:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 569b978d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Nov 2021 14:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6137A6120A
 for <wireguard@lists.zx2c4.com>; Fri,  5 Nov 2021 14:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FTnErqra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1636123349;
 h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=V3k2EK67C/wfqS9m4W9OK6VYMvrirHV1SJ4esZ4JmTc=;
 b=FTnErqragXqwXhxYhgZqZs69HcPhJ2dkH/zI6DMuD4reZSnfPHHsrCA4MpTiF2RfsfSwK4
 h4nlez9sZvqljQl0igujmKEqxzZ33xetYxzXGnQW+0w4n2MGAG8eusNifqn3h3/d4+WRRD
 wVaf6UV/DgXClXUbifichvAlLndOCDY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f69c6807
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Nov 2021 14:42:28 +0000 (UTC)
Date: Fri, 05 Nov 2021 15:42:26 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20211105 is available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <20211105144230.6137A6120A@mail.kernel.org>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

An experimental snapshot, v0.0.20211105, of WireGuard for FreeBSD has been
been tagged in the git repository.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments.

== Changes ==

  * compat: taskqueue draining was backported to stable/13
  
  Compilation should resume working with the latest stable/13.
  
  * if_wg: bump keepalive timers unconditionally on send
  
  Important fix to the timer state machine, which matches behavior on Linux and
  elsewhere.
  
  * if_wg: protect in6_mask2len with INET6
  
  Fix compilation on 12 with !INET6.

This snapshot contains commits from: Jason A. Donenfeld.

The source repository is available at the usual location:
  git clone https://git.zx2c4.com/wireguard-freebsd

This snapshot is available in compressed tarball form:
  https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20211105.tar.xz
  SHA2-256: 454f2cf15329ccf40da15f8df61f8d70bb6d382efdfe4a5899ca16474f91903f

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAmGFQrYQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrucXD/9cnVv050l3zzSKriaIBnrZfVgUVfKtZWmg
KVmc/tKViFph1Mnx+n8EAHAf05n93v7J9b65l7syb7OUnv8IseoG16Iw38erbEsu
kkaF1BK9lJ4pLjBKtAcTnzwipm8aXf6Ge+HPwzRO30mOL11DnD1gbLqrFwIKQHUC
HI7K0Bv+6t54t17vnaVvO51JJME4NpRDQ0zqIMROROGIRYJLbnivZRHcIxN4lQuJ
IlY8Bzj3dyzYKJqdB6mvAm2XShGx4265Qo6uo31Qyuo8SJVXFnb5WEnc30Aw1tHc
Fi3cqWnia84TW/X+PyH3wHhRjC4JJNms7qpIvE4GN5uil6Z2sqfOF7WxkVAhiSX9
RltirnHuw8KELsomYmje2wDcDE//Yxucj9cV0/qOqCzhvgiuggNlIIRdQHkbVhsm
RAAh6N9fcFWxWQTfXbWqToFVOImzPBS7r1ewYZbT8VFvp41CtSArio+yc5feVbei
s78KMWPhJWX5s9cxXoyeJAL9YJAaeUvGvB1d0590+N8iC/jQwJrvViCd5fqlzXLe
7x6Ge02ekkYsWc+MubfEm1zFYGMrTxmCRfElIZz48BweuzMtOQRzRlGQQR88NyUx
vt71YDb8xSC1/zIeQdlfOgvqvtcPDC9ZkneHxWOV39Iwc7W9KfopXOTUVgfC4NEs
oDs2uLmsSQ==
=Q4TN
-----END PGP SIGNATURE-----

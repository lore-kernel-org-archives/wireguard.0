Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4004BF483E3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 18:34:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 49048275;
	Mon, 23 Mar 2026 18:31:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 78246680
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 18:31:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 404364408E
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 18:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9733C2BC9E
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ScTaf9HW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1774290701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9N8glU3mpsoGx4QNwbYp+l7eItWTWk56qY8ec3Zl8g=;
 b=ScTaf9HWay+nK0nW5mNV8mK4I1ujR18JdziukpPOOo4Q+N25sYgS+NTtRyaKNj+mcg1qg9
 sIJ0YHC7V1Su0Md23g7Sodl6yn7eAINwPCv3Lg9ltqjI+rDfVdX+ZKo/fiQlIN4UOtUs72
 iU3cfCQ41/JWENtm6RDSll6POR7b/q4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 686f18bd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 18:31:40 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-66f3e7d9eccso301636eaf.1
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 11:31:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YxCCnpcpnHFFeP+i/FnIWsM/sTYqg21JLxfLkeSjiBDmBKhMwNx
 LVtSlCx5CXIbZSf4XpDKuZ78XWV02TzohBP6mOVb0bR1lol8qpriWAq62hPK8awIWPzuL++N5At
 8reCxZpeP889L+kGy3w6dG8/Quj9bn3k=
X-Received: by 2002:a05:6820:2d0c:b0:67d:e5f5:250a with SMTP id
 006d021491bc7-67de5f52789mr4260197eaf.2.1774290699926; Mon, 23 Mar 2026
 11:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260318230635.227291-1-jeroen@robben.io>
In-Reply-To: <20260318230635.227291-1-jeroen@robben.io>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Mar 2026 19:31:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9payKWRXpwF40AXQuQ2v4YCNp6+Dwt_fqzmCMvnL0v9tA@mail.gmail.com>
X-Gm-Features: AQROBzArw1z3wpPZb80WNHCuE7GKbvEteuuusL6i0rdnhPvo_jw_KAEkajuxp-Y
Message-ID: <CAHmME9payKWRXpwF40AXQuQ2v4YCNp6+Dwt_fqzmCMvnL0v9tA@mail.gmail.com>
Subject: Re: [PATCH] wireguard: use memzero_explicit() when zeroing handshake
 key material
To: Jeroen Robben <jeroen@robben.io>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Mar 23, 2026 at 6:42=E2=80=AFPM Jeroen Robben <jeroen@robben.io> wr=
ote:
>
> Replace memset() calls in handshake_zero() with memzero_explicit()
> to ensure clearing handshake state is not optimized away by the compiler.

Why would the compiler do this? These aren't some stack variables that
are never touched again subsequently. It's zeroing out some members of
a pointer that lives elsewhere.

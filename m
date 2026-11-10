Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129E360A6F6B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 17:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=enuBIIWh
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 44259fce;
	Tue, 10 Nov 2026 17:49:19 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ebd06acc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 17:49:13 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c49c32650adso161385866b.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 09:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794332953; cv=none;
 d=google.com; s=arc-20260327;
 b=Q0UsUzJQCLZDkqcBa9xjC3875OR2GnaivpsBKkwNNEuJtymJxJfl+iUtGLm6vgx5/3
 zK2M1BCjquO521VmdhVKk5jFWl3gD6FO9CqqzpN8dWEEglzcgfuls5mu4U3pFASlSLtX
 kGsM6uaJo51scSn7N/V3Lk3z7dTD6Sb8tqkhkVKj5Q7Rz9gVlz1xBUWqz2ygRPWR+QXL
 dxznAPEY8ziGAea+QfcnA5DghWGIEzBqn7umpDf61AqtusdTD9M1R69XNpq4f5Fx1kRf
 4Nm4GcMPHWo+G2N9ZF7W1WXEwOjodqM13OVrhcMJ7rt10MdzDcbtjH2AXZ92kR8cWzkv
 y0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=j6/vIY1+KYQxBreFtYkfvG0gVjy/kF+drhNwxzom6y4=;
 fh=idyCSe7dilMlteEwZZgn8eaIj+kzevlg6ZoJ2i+92+0=;
 b=smOBCAWqg/VsrtGJsoomcEsfoKvmzrgfqbaxrjvKoKAC/q8VwYADLFuCT6eTfirM09
 Vtch3QUdXOJYmV42VGmp/KUaHNvjdqCQh8DJfMIpDJXHE3fG8l+MU/C16Z2eB2VCE2Sw
 Qe8/wud7Ihmk60EFeKyptzzBXzkSYQSFTIzc293onIj1yECwYUcX1SqaClZ0O6a9PLiW
 NgtiQUAQBFGRL/zkKAyLwo7jfR7A2MnwtuqC2+B29oDhwThLJj62HoCLzU81dcvbWiHy
 f4XA/gX4xD0cKDqIND/kkx8evx/DDhK0L/G63+6Ga7hNhvMvpXk/uE/unda3HlfAGZzC
 52Tw==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zx2c4.com; s=20261015.g; t=1794332953; x=1794937753; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=j6/vIY1+KYQxBreFtYkfvG0gVjy/kF+drhNwxzom6y4=;
 b=enuBIIWhg8O4+N/i7HKZaPWg5oJaXLpU6NnkbYlrRpBPoo80rWozF71TW7ArNfXfod
 gtUdQ1UvtuZjdtVbOrYH55unYAXAdd3xqegD6TFocSLyQrVTguQOHxxgSxSsRSZzEDKd
 ehWupG44Eew+tjEKikEM9J/FoKvH4GPTTq3rRtCNJVlMmGTauA26Jeb20P28neD9pBZp
 Opx/WIk+3oCCOEqZZISaTiXxyQWQlcLcVQ4LDuZOooB6XkzdyJWKAxw1dlzuWiQ7Yvxv
 jgy4dmAEFq06BwhT/larnT16oJOF6pjjKrmxLGbRkuWMGieljyZPjLQU/A+Mj7LjTUmi
 oqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794332953; x=1794937753;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=j6/vIY1+KYQxBreFtYkfvG0gVjy/kF+drhNwxzom6y4=;
 b=LJ8zlUKhjo5wMB8dWsPXtld9jhHyXxaRVF5zpPObTEl1LC6ZpfCn9uSHwEO8UNTtZi
 FcdPWa/hoHnDUIBfRe4YQhPK1Xo3ynW2BdOaVsGA1x0WOt/hQNzCjN2+hFRBQrJVxTuF
 qSnprdSezvnfF4ZFJwxiK67/71T3tWBH61nGDaWlYaDxoouUMUsI4GWHM8SanMVdk3Kn
 4V5K5IjOyHAD7DmbORK1BqrEBnnprkOrMLYxYT2Dn4QkAORJHkw1sLWPVWaeSuNJMkGX
 QPsYJhB49irD19NAS+adQCW6UGN23V2AiI8XF9DuwjTM6+PhPoQKisDWHXvTRxCcOxuI
 dGOw==
X-Gm-Message-State: APuU4Z8L0kQkdp7D6e+Z4H3NTMQYy/8o/CrRgRRcyghKkzXQMXAn1dDI
 eWKtX0d3SBRCtywmVcqxm0HUBLtRqBEWwvBxhb1C897j5DziDbaDFdRyPqiDZrNh5bmpYw2XQsK
 6DZVV59mAofua9SstEF0LPWbNnEksBjKzW+rhfBgNYPDmgw==
X-Gm-Gg: AYBFou3vtjqZKBaJ9vavzZXeSqaKW2mWZyRhiK6mOpSgMghf00VJyAipMZ4y895R1AD
 e7dHPdl9PWQ9zUenjHBoM5jx9tMq8ZoELBLTd+nWJjFjAoqMDeieBJ9y0Kpz0RES+6MKYOeY0uu
 9C6Um9r0GwBkT74H/P3OsEkhA8i4JPPpRsLoApjlUXLsSMX/o69x9XmBoB1X3XZuDimkZ6CxEUk
 Saxbbkj0FuPVyJekNhp8ehqRMHn4iOupQy+cDx2DkidQwvG4SyJ5USED6Fr8GjgnZ9peITyCnFA
 I/BKK092SLCEXFO7G7LGbgJvhkKgDKaLZ4wLHpB1LRDEr6PSYrzNdW38XSgohw3UdS8PSZa8SVl
 /cv830iSULp0hahUjLfOl1nb3F+JoggHOKQaqEs6/JaIQ0c2nVWsK97c2GnfGSUMt1/7ACpofKP
 s69h1V/QPohctblCUVVmfPVNMgoYs0CgaMavW5LWU2K9JgcCnkvadc241l9n1WuHLpDi76fL1cu
 0iB
X-Received: by 2002:a17:907:3fa2:b0:c40:38b5:d784 with SMTP id
 a640c23a62f3a-c5049609f4fmr264194266b.22.1794332952982; Tue, 10 Nov 2026
 09:49:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>
 <avNCdbpjxM752XSw@zx2c4.com>
 <89b5e08e2a48c33be4cf2d495266d04a2dcf406e.camel@infradead.org>
In-Reply-To: <89b5e08e2a48c33be4cf2d495266d04a2dcf406e.camel@infradead.org>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 10 Nov 2026 18:49:00 +0100
X-Gm-Features: AclHuK_fmNqGYrX8aoD5zj-ji2pF_XvdH1TFaa_HSiH96TwcOL_EUaS0rm5SADg
Message-ID: <CAHmME9pWbftSmnJgLawNmWxNHMEqC5evxWPW8TruYkBD18Q8nQ@mail.gmail.com>
Subject: Re: [PATCH] wireguard: socket: fix sticky source address on p2p
To: David Woodhouse <dwmw2@infradead.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S.Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Ralf Lici <ralf@mandelbit.com>, 
 Sabrina Dubroca <sd@queasysnail.net>, openvpn-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 5:47=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> On Tue, 2026-11-10 at 17:12 +0100, Jason A. Donenfeld wrote:
> >
> > Hmm... How did you choose __ip_dev_find() over, say,
> > inet_lookup_ifaddr_rcu(), which is structurally more similar to
> > ipv6_chk_addr()?
>
> __ip_dev_find() is what's exported to modules. It internally takes the
> RCU lock and calls inet_lookup_ifaddr_rcu(). It also falls back to a
> RT_TABLE_LOCAL lookup, which I think is the right thing here too.

Okay, makes sense.

This simple patch reproduces the issue in the test suite (and confirms
your fix):

diff --git a/tools/testing/selftests/wireguard/netns.sh
b/tools/testing/selftests/wireguard/netns.sh
index a8f550aecb35..5dfecb4c6ef1 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -474,7 +474,7 @@ n2 ping -W 1 -c 1 192.168.241.1

 # What happens if the inbound destination address belongs to a
different interface as the default route?
 ip1 link add dummy0 type dummy
-ip1 addr add 10.50.0.1/24 dev dummy0
+ip1 addr add 10.50.0.1 peer 10.50.0.2/32 dev dummy0
 ip1 link set dummy0 up
 ip2 route add 10.50.0.0/24 dev veth2
 n2 wg set wg0 peer "$pub1" endpoint 10.50.0.1:1


So I'll add a followup commit adding this to netns.sh.

Thanks for fixing this! Applied to the wireguard repo.


Jason

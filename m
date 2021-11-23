Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88907C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 20:41:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 241743c5;
	Tue, 23 Nov 2021 20:41:34 +0000 (UTC)
Received: from zeus.servers.mnus.de (zeus.servers.mnus.de
 [2a01:4f8:c0c:4339::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dfc3414e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 19:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mnus.de;
 s=mnus.de-helios; t=1637694370;
 bh=709W7UZzdXhE683wblNBNo2H76Bpdg1oL5M4IcUiabo=;
 h=From:To:Cc:Subject:Date;
 b=e7IhL6ejtwaBBukReVNII0vXJRp2YHdnHfReGf1XR3hA+vK3FNWUw1Mjh3IU+pSV8
 mC5/IxUgQxLAGoGk8dH5VhgKkFFOjk2UxV8FkVqEZB7Qo0yWu8GaExz0IqNvszfNmn
 mIQKQiwR9WoIHIj8OMEa1DB1T078vSTgvj3eDNX6Ce+oX9l1RDV5tPaeFpEq1W4bYS
 OI4tYja2HOTTbnpOHcThi+5liw5IacgY67rdaD66uUCQu9oL8Ya7zgAyWBK6o1xzDg
 MnAgTOunjLGoYfAzTd2GXFxQO+Zqz6k7IDVP4t7h8t20y7FKZkmvyVx+7DyVxtAueW
 swBY9BaHXzWrxh4QD/opQgLT9D8/hbl1liUtF3XVf0Ya8peL6ZPYuoJiy+O+0PqWfY
 lcWEwz/2OoGtBUd49eazS50BmtYFgpQhJgBBARFeBR/k6MnKQx6z/qimVkwuw/9ZoD
 c1j0ubLwXGyZneAN7esWlbVeH3OuZtVqzyi01BKUSEZmjRuE/GJEbUqNnZ+zDRmdBn
 bUYgrGFvqIHDU6D/YwiDeZup3w/e6y8Kq7MXnItvra0kIkvkjFVH7YhdXHwWHlv4Ez
 6dckuIOQGQauo5Z3tbhNWYj+UOeYTpQli45XL6wuYJgQnWOXMOPr7PpWMGms8tHdME
 N+kvYkQgGxr4D1c64F6w3e7Y=
From: Thomas Renoth <minus@mnus.de>
To: wireguard@lists.zx2c4.com
Cc: Thomas Renoth <minus@mnus.de>
Subject: [PATCH wireguard-go] conn: linux: fix incorrect endpoint address
Date: Tue, 23 Nov 2021 20:03:32 +0100
Message-Id: <20211123190331.101346-1-minus@mnus.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 20:41:31 +0000
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

Signed-off-by: Thomas Renoth <minus@mnus.de>
---
`wg show` just shows 0.0.0.0:<port> for peer endpoints currently.

 conn/bind_linux.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conn/bind_linux.go b/conn/bind_linux.go
index 975a6ab..da0670a 100644
--- a/conn/bind_linux.go
+++ b/conn/bind_linux.go
@@ -275,7 +275,7 @@ func (end *LinuxSocketEndpoint) SrcIP() netip.Addr {
 
 func (end *LinuxSocketEndpoint) DstIP() netip.Addr {
 	if !end.isV6 {
-		return netip.AddrFrom4(end.src4().Src)
+		return netip.AddrFrom4(end.dst4().Addr)
 	} else {
 		return netip.AddrFrom16(end.dst6().Addr)
 	}
-- 
2.34.0


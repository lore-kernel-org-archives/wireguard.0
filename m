Return-Path: jehan@altheamesh.com
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13158ab4
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 02:01:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 83CA5208D5
 for <wireguard@lists.zx2c4.com>; Wed,  5 Oct 2016 22:12:57 -0400 (EDT)
Message-Id: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
From: Jehan Tremback <jehan@altheamesh.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain
Date: Wed, 05 Oct 2016 19:12:57 -0700
Subject: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Are there any plans, or would you even consider, adding an option to
WireGuard to disable encryption, and only authenticate packets? I'm
assuming that an authentication-only mode would be significantly faster
(maybe I'm wrong though). My use-case only needs auth, so if I were to
use WireGuard, the encryption would be redundant. 

-- 
  Jehan Tremback
  jehan@altheamesh.com

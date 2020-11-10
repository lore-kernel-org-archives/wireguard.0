Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC55CC388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:57:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6970D207D3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6970D207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c586f1d6;
	Tue, 10 Nov 2020 13:53:18 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 944ae564
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 13:53:16 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 672D657A
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 13:56:56 +0000 (UTC)
Date: Tue, 10 Nov 2020 18:56:56 +0500
From: Roman Mamedov <rm@romanrm.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: No longer compiles on 5.4.76
Message-ID: <20201110185656.541102fe@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hello,

Building kernel 5.4.76 with WireGuard v1.0.20200908 fails for me now with:

  AS [M]  net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o
In file included from <command-line>:
././net/wireguard/compat/compat-asm.h:44: warning: "SYM_FUNC_START" redefined
 #define SYM_FUNC_START ENTRY
 
In file included from ././net/wireguard/compat/compat-asm.h:9,
                 from <command-line>:
./include/linux/linkage.h:218: note: this is the location of the previous definition
 #define SYM_FUNC_START(name)    \
 
In file included from <command-line>:
././net/wireguard/compat/compat-asm.h:45: warning: "SYM_FUNC_END" redefined
 #define SYM_FUNC_END ENDPROC
 
In file included from ././net/wireguard/compat/compat-asm.h:9,
                 from <command-line>:
./include/linux/linkage.h:265: note: this is the location of the previous definition
 #define SYM_FUNC_END(name)    \
 
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S: Assembler messages:
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:123: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:185: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:187: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:319: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1016: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1616: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1620: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1810: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1812: Error: invalid character '(' in mnemonic
net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.S:1959: Error: invalid character '(' in mnemonic
  CC [M]  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.o
scripts/Makefile.build:348: recipe for target 'net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o' failed
make[3]: *** [net/wireguard/crypto/zinc/chacha20/chacha20-x86_64.o] Error 1
scripts/Makefile.build:500: recipe for target 'net/wireguard' failed
make[2]: *** [net/wireguard] Error 2


-- 
With respect,
Roman

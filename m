Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9A5C54E67
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Mar 2024 12:23:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1034ac9;
	Fri, 15 Mar 2024 12:20:08 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 416d1f85
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Mar 2024 12:20:06 +0000 (UTC)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C12E1FB63;
 Fri, 15 Mar 2024 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710505206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
 b=l/e5XwYQbWLxydmcJ3dP3h+TmZMhT1FLZriFlvKl3dO83ajywTRQZDoTGzQ6d37zYbpvX8
 j9HGF0DluKgK6SNCI3JeITcXniTDi/NGpVn02KIxbEYg76EHdjf9QLo8rSMv2e4s7QFrr1
 ULg98ZIPcFCZCX3QQelfGEN9v0BaH20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710505206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
 b=PBLRRzksiC1Lnz0/B1TnDNaDkpBm4oUnKH/33HfX9HG0In1bcThlAiMzrHMKAYNKIP6sOI
 WLEEVnH1KpyoexDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710505206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
 b=l/e5XwYQbWLxydmcJ3dP3h+TmZMhT1FLZriFlvKl3dO83ajywTRQZDoTGzQ6d37zYbpvX8
 j9HGF0DluKgK6SNCI3JeITcXniTDi/NGpVn02KIxbEYg76EHdjf9QLo8rSMv2e4s7QFrr1
 ULg98ZIPcFCZCX3QQelfGEN9v0BaH20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710505206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
 b=PBLRRzksiC1Lnz0/B1TnDNaDkpBm4oUnKH/33HfX9HG0In1bcThlAiMzrHMKAYNKIP6sOI
 WLEEVnH1KpyoexDg==
Date: Fri, 15 Mar 2024 13:20:05 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org
Subject: Cannot load wireguard module
Message-ID: <20240315122005.GG20665@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.47 / 50.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 R_MIXED_CHARSET(0.83)[subject]; BAYES_HAM(-0.00)[43.28%]
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

I cannot load the wireguard module.

Loading the module provides no diagnostic other than 'No such device'.

Please provide maningful diagnostics for loading software-only driver,
clearly there is no particular device needed.

Thanks

Michal

jostaberry-1:~ # uname -a
Linux jostaberry-1 6.8.0-lp155.8.g7e0e887-default #1 SMP Wed Mar 13 09:02:21 UTC 2024 (7e0e887) ppc64le ppc64le ppc64le GNU/Linux
jostaberry-1:~ # modprobe wireguard
modprobe: ERROR: could not insert 'wireguard': No such device
jostaberry-1:~ # modprobe -v wireguard
insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko.zst 
modprobe: ERROR: could not insert 'wireguard': No such device
jostaberry-1:~ # modprobe chacha-generic
jostaberry-1:~ # modprobe -v wireguard
insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko.zst 
modprobe: ERROR: could not insert 'wireguard': No such device
jostaberry-1:~ # 


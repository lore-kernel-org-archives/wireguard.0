Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD011CD8C9D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Jun 2026 13:36:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 372441ab;
	Mon, 8 Jun 2026 13:36:28 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0b913d66
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jun 2026 13:36:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0CB1E66FD3;
 Mon,  8 Jun 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1780925781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lGdUCmEKeE5LE4P9qQJ1QzkY1tkWxF02AJQjnr/iq2s=;
 b=t4Mz0gW1nRliEeYYtkH5Q056ANkSHXKFlUz0utZxECDlIHyUApJPrWC/KUV9TKwgdh2sFt
 2pJotAA16EW/UnEl7cHyKUxadbO4QOIls5kVHgQXObKwL2IPn1BxHqbLcendtmOH8/zNwu
 rgPOWgKyr4ZCrxlNZNf19eLth7+dj+c=
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.com header.s=susede1 header.b=t4Mz0gW1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1780925781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lGdUCmEKeE5LE4P9qQJ1QzkY1tkWxF02AJQjnr/iq2s=;
 b=t4Mz0gW1nRliEeYYtkH5Q056ANkSHXKFlUz0utZxECDlIHyUApJPrWC/KUV9TKwgdh2sFt
 2pJotAA16EW/UnEl7cHyKUxadbO4QOIls5kVHgQXObKwL2IPn1BxHqbLcendtmOH8/zNwu
 rgPOWgKyr4ZCrxlNZNf19eLth7+dj+c=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E37CE779A7;
 Mon,  8 Jun 2026 13:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0eYWNlTFJmpZBgAAD6G6ig
 (envelope-from <rfrohl@suse.com>); Mon, 08 Jun 2026 13:36:20 +0000
From: Robert Frohl <rfrohl@suse.com>
To: wireguard@lists.zx2c4.com
Cc: Robert Frohl <rfrohl@suse.com>
Subject: [PATCH] Revert "dns-hatchet: apply resolv.conf's selinux context to
 new resolv.conf"
Date: Mon,  8 Jun 2026 15:36:10 +0200
Message-ID: <20260608133610.108416-1-rfrohl@suse.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0CB1E66FD3
X-Spamd-Result: default: False [-2.99 / 50.00]; BAYES_HAM(-2.98)[99.91%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; DKIM_SIGNED(0.00)[suse.com:s=susede1];
 DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

This reverts commit 2ce4680bd34f371aacd3c09673c3c907274321cd.

selinux does not allow every domain to set file contexts and will raise
relabelto/relabelfrom AVCs and block these changes if a domain tries to update
the selinux context.

It is better to ignore selinux and leave the proper labeling to the
selinux policy, which can add proper file transitions for the right
context.

This also allows for a cleaner change in the selinux policy, because
otherwise it will need infrastructure to hide the relabel AVCs as well.

For reference please see the selinux policy PR:
  https://github.com/fedora-selinux/selinux-policy/pull/3030

Signed-off-by: Robert Frohl <rfrohl@suse.com>
---
 contrib/dns-hatchet/hatchet.bash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/contrib/dns-hatchet/hatchet.bash b/contrib/dns-hatchet/hatchet.bash
index bc4d090..6f167cc 100644
--- a/contrib/dns-hatchet/hatchet.bash
+++ b/contrib/dns-hatchet/hatchet.bash
@@ -20,11 +20,9 @@ set_dns() {
 		[[ ${#DNS_SEARCH[@]} -eq 0 ]] || printf 'search %s\n' "${DNS_SEARCH[*]}"
 		} | unshare -m --propagation shared bash -c "$(cat <<-_EOF
 			set -e
-			context="\$(stat -c %C /etc/resolv.conf 2>/dev/null)" || unset context
 			mount --make-private /dev/shm
 			mount -t tmpfs none /dev/shm
 			cat > /dev/shm/resolv.conf
-			[[ -z \$context || \$context == "?" ]] || chcon "\$context" /dev/shm/resolv.conf 2>/dev/null || true
 			mount -o remount,ro /dev/shm
 			mount -o bind,ro /dev/shm/resolv.conf /etc/resolv.conf
 		_EOF
-- 
2.53.0


Return-Path: <SRS0=wRPw=EU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DCCC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 11:55:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D7D8217A0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 11:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=53c70r.de header.i=@53c70r.de header.b="EVG+VcXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D7D8217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12c490ee;
	Sat, 14 Nov 2020 11:50:55 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [2a03:4000:4a:b7f::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c1d6d86c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Nov 2020 11:50:52 +0000 (UTC)
To: wireguard@lists.zx2c4.com
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de BE67F407EA34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=53c70r.de;
 s=default; t=1605354902;
 bh=tSHQQUqqgXE5Vx+csJd5Z1asYcfOjLhEMZwx7gUTrMc=;
 h=To:From:Subject:Date:From;
 b=EVG+VcXIf4G6Y27dFVbXngqqvTk3wrwnVZtR/XXAqg+3UEOs8M0/Mr8/9/WbenEuV
 4sR+tDm5hyo+/FPOXtX+ZeI9VYhTWzFz3tmTYOogHhzknoZWvvBiAxjgYKOhQOkzXI
 eZO4NL7UVaFbf6sWM5MqHkErRf7EMRZhNl327ywg=
From: Silvan Nagl <mail@53c70r.de>
Subject: Progress on resolvectl DNS fail
Message-ID: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
Date: Sat, 14 Nov 2020 12:55:01 +0100
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi,

since I use Fedora for daily use I would like to know if there is 
already some progress on this issues:
https://github.com/systemd/systemd/issues/17529
https://bugzilla.redhat.com/show_bug.cgi?id=1895518

Regards,

Silvan


Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB23AC636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:32:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bec46b0;
	Tue, 7 Feb 2023 04:29:36 +0000 (UTC)
Received: from mx.mokrynskyi.com (mx.mokrynskyi.com [46.4.12.50])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1730f936
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jan 2023 13:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.mokrynskyi.com (Postfix) with ESMTP id 2604532D476
 for <wireguard@lists.zx2c4.com>; Sat, 21 Jan 2023 13:22:38 +0000 (UTC)
Authentication-Results: mx.mokrynskyi.com (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=mokrynskyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mokrynskyi.com;
 h=content-transfer-encoding:content-type:content-type:subject
 :subject:from:from:content-language:to:user-agent:mime-version
 :date:date:message-id; s=dkim; t=1674307356; x=1675171357; bh=pB
 kgYdcjwLEoZKDgXdrPDZPJiGP7CU+ToTh+ri9Y0tQ=; b=t2LWayYtzrpJFk8c6k
 Kk8SbRpLNxzbC2dFepdJYn6/p3Z/SNfM8TSft2INMeJlv8kFqixn1Q9JR8h/yoLm
 k3sy6AkHsmogIX2/8urUTLD0CuLa4ev74jodzfAfKf5iwgkS6SXgJZYyV/OiBsab
 32KCMNEgpUfPFnkPApZjlFwQc=
X-Virus-Scanned: Debian amavisd-new at mx.mokrynskyi.com
Received: from mx.mokrynskyi.com ([127.0.0.1])
 by localhost (mx.mokrynskyi.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wgiosSenJwZo for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jan 2023 13:22:36 +0000 (UTC)
Received: from [192.168.1.2] (unknown [176.100.4.39])
 by mx.mokrynskyi.com (Postfix) with ESMTPSA id E5DE932D474
 for <wireguard@lists.zx2c4.com>; Sat, 21 Jan 2023 13:22:35 +0000 (UTC)
Message-ID: <5e029a99-a860-0ae0-be72-df53cf82d0ce@mokrynskyi.com>
Date: Sat, 21 Jan 2023 15:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Thunderbird/109.0
To: wireguard@lists.zx2c4.com
Content-Language: ru
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Allow client-side encrypted backups for Android app
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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

Basically this: https://github.com/seedvault-app/seedvault/wiki/FAQ#why-do-some-apps-not-allow-to-get-backed-up

I'm moving to non-rooted ROM for the first time in many years (GrapheneOS) and it is a major pain to configure all the apps manually when apps deliberately disable backups in their apps.

According to following example provided it is trivial to do: https://github.com/grote/Transportr/commit/4dc38f429f75909a088d8bd8a5b3b5ddd8030f71

-- 
Sincerely, Nazar Mokrynskyi
github.com/nazar-pc


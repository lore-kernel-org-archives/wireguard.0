Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB2BC54EE9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Sep 2022 08:12:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 92f96af9;
	Tue, 20 Sep 2022 08:12:02 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 60cfcad1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Sep 2022 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pIexM7DBEprceBdiKhDrYY8mfLKCyYkQkvTp/sI/fFI=; b=WskYwvOK/HRezunl5asp86PQVp
 J7IephbmC7j3313PH+ZfsMyixRgZgybvk5lmFI/Tvxs9zCFcTCgKpXbo2tfNVKDaK8v/DHIJGA2fR
 vhUH9TD3aPcVVox5YClIcqNk7vufzz465ya9tXBPN7r90rlvMof6TtRcOLld/7boDQ/Y=;
Received: from [10.5.44.225] (port=26568 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLS1) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 (Exim 4.95) (envelope-from <mail@chil.at>) id 1oaYLp-0007bv-2i
 for wireguard@lists.zx2c4.com; Tue, 20 Sep 2022 10:11:49 +0200
Received: from [172.27.0.87] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Tue, 20 Sep 2022 10:11:29
 +0200
Message-ID: <62cc526e-7b02-3529-d575-87434af15bd3@chil.at>
Date: Tue, 20 Sep 2022 10:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Christoph Loesch <wireguard-mail@chil.at>
Subject: WireGuard App on Android allows only one connection simultaneously
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.44.244]
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

on Linux multiple connections at the same time are possible, on Windows also. I don't have a Mac so I can't test there.

When having two tunnels configured in the Android App, while one is connected if I connect to the second one, the first one disconnects.

Is there any reason as why the Android App only allows one connection at the same time?

Thank you and kind regards,
Christoph


Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D45C4706E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:55:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae40836a;
	Wed, 20 Dec 2023 05:00:29 +0000 (UTC)
Received: from forward103c.mail.yandex.net (forward103c.mail.yandex.net
 [2a02:6b8:c03:500:1:45:d181:d103])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37f7d16b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Dec 2023 16:00:04 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:c83:0:640:84f9:0])
 by forward103c.mail.yandex.net (Yandex) with ESMTP id A1EC560B16
 for <wireguard@lists.zx2c4.com>; Tue, 19 Dec 2023 19:00:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 20PCO96OqOs0-2Mzj6okC; 
 Tue, 19 Dec 2023 19:00:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1703001603; bh=6O4u3pR5IJngh2aaD6/rc58czcCMD93vGKc2tAL9SLY=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=QY1lqmEMxzEeCTalqR8OK6qKq98FcrCIxm1qgGv4UHZ9KIVijMGPHlDBkH9KX+2oZ
 IhiVPKSQeqhdpT+p/ZANFiHyPjmg3rLd1buqbwFYO6VQj+x9KcfXdf4smhnKyNT+AN
 po5+xax/KCC59ApGCMl5cOwY2PwX3sDjjVEThQ08=
Authentication-Results: mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: Roman Lesechko <polo-ru@yandex.ru>
To: wireguard@lists.zx2c4.com
Cc: Roman Lesechko <polo-ru@yandex.ru>
Subject: [PATCH] Edited RU translation to avoid misunderstanding
Date: Tue, 19 Dec 2023 18:59:23 +0300
Message-Id: <20231219155923.1892-1-polo-ru@yandex.ru>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Dec 2023 05:00:21 +0000
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

I have edited RU translations of "macToggleStatusButton" on the main screen. In english button's caption is imperative: Activate/Deactivate. Current russian translation is wrong in terms of tenses. For example, Wireguard is deactivated, but the button's caption says it is already active.

Signed-off-by: Roman Lesechko <polo-ru@yandex.ru>
---
 Sources/WireGuardApp/ru.lproj/Localizable.strings | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Sources/WireGuardApp/ru.lproj/Localizable.strings b/Sources/WireGuardApp/ru.lproj/Localizable.strings
index c05a566..ab148dc 100644
--- a/Sources/WireGuardApp/ru.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/ru.lproj/Localizable.strings
@@ -55,9 +55,9 @@
 "tunnelStatusRestarting" = "Перезапуск";
 "tunnelStatusWaiting" = "Ожидание";
 
-"macToggleStatusButtonActivate" = "Подключен";
+"macToggleStatusButtonActivate" = "Подключить";
 "macToggleStatusButtonActivating" = "Подключение…";
-"macToggleStatusButtonDeactivate" = "Отключен";
+"macToggleStatusButtonDeactivate" = "Отключить";
 "macToggleStatusButtonDeactivating" = "Отключение…";
 "macToggleStatusButtonReasserting" = "Переподключение…";
 "macToggleStatusButtonRestarting" = "Перезапуск…";
@@ -111,7 +111,7 @@
 "tunnelOnDemandAddMessageAddNewSSID" = "Добавить новый";
 
 "tunnelOnDemandKey" = "Автоподключение";
-"tunnelOnDemandOptionOff" = "Выключить";
+"tunnelOnDemandOptionOff" = "Отключено";
 "tunnelOnDemandOptionWiFiOnly" = "Только Wi-Fi";
 "tunnelOnDemandOptionWiFiOrCellular" = "Wi-Fi или сотовая сеть";
 "tunnelOnDemandOptionCellularOnly" = "Только Сотовая сеть";
@@ -134,7 +134,7 @@
 "tunnelEditPlaceholderTextStronglyRecommended" = "Настоятельно рекомендуется";
 "tunnelEditPlaceholderTextOff" = "Выключить";
 
-"tunnelPeerPersistentKeepaliveValue (%@)" = "каждые %@ - интервал в секундах";
+"tunnelPeerPersistentKeepaliveValue (%@)" = "каждые %@ секунд";
 "tunnelHandshakeTimestampNow" = "Сейчас";
 "tunnelHandshakeTimestampSystemClockBackward" = "(Системные часы переведены назад)";
 "tunnelHandshakeTimestampAgo (%@)" = "%@ назад";
-- 
2.37.1 (Apple Git-137.1)


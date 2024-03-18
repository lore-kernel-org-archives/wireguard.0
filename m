Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A55C54E5D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Mar 2024 19:36:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 885e25e7;
	Mon, 18 Mar 2024 19:36:43 +0000 (UTC)
Received: from mail.mokrynskyi.com
 (static.230.39.109.65.clients.your-server.de [65.109.39.230])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8ff8d33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2024 19:36:40 +0000 (UTC)
Message-ID: <d5d152e4-0acd-43ea-b89a-ffa63fc1fd2f@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
 s=dkim; t=1710790599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3BT4e3wUbXyrJOuykk9zQIDcFl22lvC0YUdOUO0Gvo=;
 b=MFeaOJN1RlBlZ/s0vP7oe5GKv3QCQpC4JaziFWBSZgRe/BRU6/tCvz0yEDJMKYc7MFz4J2
 hycQn1JDkERpvE9BLUUKtojcsKxHCO19DGGJEtyQlbfT6qjiT/uE1V3r2z7Xm/tS68EU9r
 v2RlftI0J2DUP2JfsBN/4uift4VQUlaX2+zSG/qBN8B/uiYXcUODu7Ovg4IuERrD1C6XP7
 7IWm4/l3zLzPXO3+vO+QxFIdsTUf/I/xpP8mRR4IScnObJkuZI8zBY1D6sTJFm9zBTKkUV
 5971lAuMgA+uCyAp3wWPnJg1+YbqLzWkKZDeFClAxnER4fpZEpvPrRlpGqNFlQ==
Authentication-Results: mail.mokrynskyi.com;
 auth=pass smtp.mailfrom=nazar@mokrynskyi.com
Date: Mon, 18 Mar 2024 21:36:37 +0200
MIME-Version: 1.0
Subject: Re: Android can't complete handshake
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
To: wireguard@lists.zx2c4.com
References: <1ac814fd-85ba-4b73-97b2-b13ddde13873@mokrynskyi.com>
Content-Language: en-US, uk
In-Reply-To: <1ac814fd-85ba-4b73-97b2-b13ddde13873@mokrynskyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: --
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

Still happening, hard to believe I'm the only one.
Anything else I can provide to help debug this?

Sincerely, Nazar Mokrynskyi
github.com/nazar-pc

01.11.23 03:23, Nazar Mokrynskyi:
> Basically every day I have the following in logs:
>
>> 10-16 00:46:05.380  5200  5568 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Handshake did not complete after 5 seconds, retrying (try 2)
>> 10-16 00:46:05.381  5200  5568 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Sending handshake initiation
>> 10-16 00:46:10.468  5200  5678 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Handshake did not complete after 5 seconds, retrying (try 3)
>> 10-16 00:46:10.469  5200  5678 D WireGuard/GoBackend/xyz: peer(8MoP…XPVc) - Sending handshake initiation
> This is happening on Android 14 when connected to Wi-Fi.
>
> It is definitely not a loss of Wi-Fi or Internet connectivity, I turn off and immediately turn on the VPN connection and it connects instantly and successfully, it is just those retries that are not succeeding.
>
> Is this a know issue, maybe there is a workaround?
>
> I have seen similar reports online that seem to be related to network connectivity, which is not the case here or else reconnection would fail too.
>

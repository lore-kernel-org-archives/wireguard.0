Return-Path: <SRS0=c5tI=K5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6741C47096
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jun 2021 19:40:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97A3613EE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jun 2021 19:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97A3613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d5bae30;
	Thu, 3 Jun 2021 19:40:47 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [45.142.177.54])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ea0f74a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jun 2021 19:40:46 +0000 (UTC)
Subject: Re: WireGuard responses a Handshake Initiation packet with another
 Handshake Initiation instead of Handshake Response
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de CD2CB43401B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=53c70r.de; s=mail;
 t=1622749246; bh=KPXM7UR7rEOshkhJPycuyQY9UJzDl8WK1mrcbEjCDzo=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=KF49b4AUwXhL8taqPcwiti7TNP3DaLPJFkTXLTmtqYhyF4V1gz8BprcJn/YHsJBG7
 iNgV+nODdnLi1VYBRTO1H94lPeFgKexUlwkCuX2eXLvBADGQk0DcuheXTeNY3dYbYF
 FfjxIh1okX1Bfrw6wxKDvldClbORbPfmUoG9u0SY=
From: Silvan Nagl <mail@53c70r.de>
To: wireguard@lists.zx2c4.com
References: <CA+O7g7c-XunYp0J+XWMQDEyCb=3vahgX2JaPEM-CYThvt6Ltig@53c70r.de>
 <852812b5-9210-5c70-7cef-d673967d568a@53c70r.de>
Message-ID: <c6c6f40b-25e8-8430-ff3b-3baa51414147@53c70r.de>
Date: Thu, 3 Jun 2021 21:40:42 +0200
In-Reply-To: <852812b5-9210-5c70-7cef-d673967d568a@53c70r.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

actually it was reproducible on my 4w old setup.
after updating both it ain't reproducible anymore.
openwrt: Quintus Build@2021.05.23 / LuCI openwrt-21.02 branch 
git-21.136.64332-53c572a
fedora_server: 5.12.8-300.fc34.x86_64

On 03.06.2021 21:30, Silvan Nagl wrote:
> Reproducible:
>
> Client_a <-> Gateway_a <-> Internet <-> Server_b
>
> When Gateway_a changes its WAN-IP Client_a loses connection.
> Capture files show the state after the IP change.
>
> On 6/3/21 8:43 AM, Arınç ÜNAL wrote:
>> I tried wg syncconf wg0 <(wg-quick strip wg0) without success.
>>
>> Only restarting wireguard by systemctl restart wg-quick@wg0 makes it
>> respond with a Handshake Response packet.
>>
>> This happens really rarely and especially on OpenWrt 19.07 as a client.
>>
>> Other clients can handshake properly while the server fails to
>> complete the handshake for the OpenWrt device.
>>
>> Packet Captures on boths sides are in the attachments.
>>
>> Server:
>> 5.9.0-0.bpo.5-amd64 #1 SMP Debian 5.9.15-1~bpo10+1 (2020-12-31) x86_64 GNU/Linux
>> wireguard-tools v1.0.20210223 - https://git.zx2c4.com/wireguard-tools/
>> wireguard-dkms/buster-backports,now 1.0.20210219-1~bpo10+1
>>
>> Client:
>> 4.14.221 #0 SMP Mon Feb 15 15:22:37 2021 armv7l GNU/Linux
>> wireguard-tools v1.0.20191226 - https://git.zx2c4.com/wireguard-tools/
>> kmod-wireguard 4.14.221+1.0.20200611-2
>>
>> Arınç Ü.

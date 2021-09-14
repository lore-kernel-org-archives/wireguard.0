Return-Path: <SRS0=GDNb=OE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ECAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Sep 2021 16:45:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 124EB60FD7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Sep 2021 16:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 124EB60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1a4a28e;
	Tue, 14 Sep 2021 16:45:22 +0000 (UTC)
Received: from mail1.tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccc2e778
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Sep 2021 16:45:18 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id D536260818A8
 for <wireguard@lists.zx2c4.com>; Tue, 14 Sep 2021 18:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1631637916; bh=emTLakVmxPWfYWyytTRoU9W7hUPHfSUed+BdJMdoba0=;
 h=To:From:Subject:Date:From;
 b=dByHVtlmgPXzuq619NB1CjLc36vULtx31/6BflZlhFBTA8y6CWD2SW12cKAvGp7LS
 xrVx3MwjZ+OBE/6XEP1ha4ObjW+xkzoT4AZ9nKslN/2VgzfPxD2BwiNqtIfZq4zhBZ
 KWQYv3nutWN/q6Py6rFhaBuSBaxALrrtDysH0Uj4=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id A981E6081880
 for <wireguard@lists.zx2c4.com>; Tue, 14 Sep 2021 18:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1631637915; bh=emTLakVmxPWfYWyytTRoU9W7hUPHfSUed+BdJMdoba0=;
 h=To:From:Subject:Date:From;
 b=Bzv53gU8KzPz7c1avyXg5hb7xlbmOnhCIBPlim5iRZAxHEVwAfnp/B1s3+hoParNM
 P7Kbqaoz/xXp2eRGWipHqo4gDk/bp7SHq++bJkTnlPIzZa2njPYjLI56xL5KC43ol5
 K2NW8htOaaFHshtmpzdEHaxPvshm5DeR3HSrXkOE=
To: wireguard@lists.zx2c4.com
From: Daniel <tech@tootai.net>
Subject: icmp6 on wireguard iface responded by iface lo
Message-ID: <3c3e142f-99b2-732b-2912-2889d6c09a69@tootai.net>
Date: Tue, 14 Sep 2021 18:45:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

Hi all,

I use wireguard between 2 Debian11 and face a problem: traffic goes in 
to wireguard interface/ip address but goes out with lo as interface with 
the right ip address

19:23:50.287492 wig0 In IP6 fd99:1234:beef:cafe:fade::7000 > 
fd99:1234:beef:cafe:fade::7fff: ICMP6, echo request, id 18272, seq 5, 
length 64

19:23:50.287509 lo In IP6 fd99:1234:beef:cafe:fade::7fff > 
fd99:1234:beef:cafe:fade::7000: ICMP6, echo reply, id 18272, seq 5, 
length 64

Any clue on this ?

Thanks for your support

Daniel

-- 
Daniel

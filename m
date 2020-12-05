Return-Path: <SRS0=2ayY=FJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893CBC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Dec 2020 14:19:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9EF230F9
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Dec 2020 14:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9EF230F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sager.me.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc2b5981;
	Sat, 5 Dec 2020 14:11:34 +0000 (UTC)
Received: from mail118c50.megamailservers.eu (mail1478c50.megamailservers.eu
 [91.136.14.78])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bcb86f42
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 5 Dec 2020 14:11:31 +0000 (UTC)
X-Authenticated-User: sagermail@sager.me.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1607177907;
 bh=MeYqR6P9zssYWsj43HOxrBbBk5fNFMNKOoWrH9vd7mU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=H/lJqb0qE7rYmzbgIyB1AzUvRZIZPjVUwN0y7zK3zkKNFEhjKy2+rn040TMaRFzn4
 lSOxecaupEUbr2h3LukZdewfDdt37/RRRsOuW9T2h/3dRmKBIsrnIGYtvcLXf8CRWp
 OrwzReZ1lbhrgC0tQeeaie5UQgcXwSopSb+qQyzk=
Feedback-ID: john@sager.me.u
Received: from mainserver.wc (97.83.2.81.in-addr.arpa [81.2.83.97])
 (authenticated bits=0)
 by mail118c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 0B5EIQVs024018
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <wireguard@lists.zx2c4.com>; Sat, 5 Dec 2020 14:18:27 +0000
Received: from
 9.e.e.c.3.d.e.6.7.2.3.8.6.2.d.9.0.0.0.0.3.e.b.c.0.b.8.0.1.0.0.2.ip6.arpa
 ([2001:8b0:cbe3:0:9d26:8327:6ed3:cee9])
 by mainserver.wc with esmtp (Exim 4.93)
 (envelope-from <john@sager.me.uk>) id 1klYOH-002Nbt-Hb
 for wireguard@lists.zx2c4.com; Sat, 05 Dec 2020 14:18:25 +0000
Subject: Re: dns wireguard
To: wireguard@lists.zx2c4.com
References: <38259275-2f96-feb5-d3e8-70aafb862f41@gnumeria.fr>
 <010801762ce31fbb-84ff5ca8-2674-451c-a4c7-b328af3e3a3f-000000@ap-southeast-2.amazonses.com>
From: John Sager <john@sager.me.uk>
Message-ID: <c3284f06-d3f7-904d-a0d3-74fff8e752bb@sager.me.uk>
Date: Sat, 5 Dec 2020 14:18:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <010801762ce31fbb-84ff5ca8-2674-451c-a4c7-b328af3e3a3f-000000@ap-southeast-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CTCH-RefID: str=0001.0A782F1C.5FCB96B3.0067, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=HYRqsRM8 c=1 sm=1 tr=0 a=dws6IJh5fU+Ftmrx3Eq8JA==:117
 a=dws6IJh5fU+Ftmrx3Eq8JA==:17 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zTNgK-yGK50A:10 a=ZYNPqgc7Aq_5GiiV6JAA:9 a=QEXdDO2ut3YA:10
X-Origin-Country: GB
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

Look at the routing table on A, B and the host with two tunnel connections 
as well.


On 04/12/2020 08:34, Shulhan wrote:
> 
> 
>> On 3 Dec 2020, at 23.25, Esteban <esteban@gnumeria.fr> wrote:
>>
>> Hello, I take the liberty to contact you, I have a huge bug, and it's not me who is at fault, I prefer to specify it, some friends have exactly the same bug as me.
>> I like wireguard because it's very easy to connect on several tunnels simultaneously but when, (I'll schematize)
>> I have two wireguard customers
>> In the configuration of the wireguard A server I will have in DNS
>> 172.16.150.1
>>
>> And in the configuration of the wireguard server B I will have in DNS
>> 172.16.155.1
>>
>> I start by connecting to the first client, the wireguard A server.
>> I manage to ping the DNS of this server A.
>>
>> I keep the connection from server A and connect to server B.
>> I can ping the DNS of server A but not the DNS of server B.
>>
> 
> I think we need to see your configs, especially the AllowedIPs options, both on A and B (client and server).
> 
> 

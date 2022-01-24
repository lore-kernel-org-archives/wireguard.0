Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC77CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Jan 2022 18:28:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ec13cdcf;
	Mon, 24 Jan 2022 18:26:57 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e4e7db71
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Jan 2022 18:26:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s18so15254375wrv.7
 for <wireguard@lists.zx2c4.com>; Mon, 24 Jan 2022 10:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4XAI3k0FxRUdQsyp2h5lwphfk/GwAmAxYvgNnXb2nxw=;
 b=bA5sYvNxQuGWi1zigZ3gs5TUd1yvuAgBPFYUoZph8ZCHBRh2yD9S5yNfR+hlEx73JQ
 SVw9pklsSsGD5g2eEtKPjREj6wu8BKI0qAvj6xIQJhQ2GBZJG8VlJf+0B5O3KhQpWwta
 WRuM21Zrf7GfJph2O56V0LDuFwZIII/b8HCTmXLSC49dlzpA7oJj9AYJcQunSqLhYxhr
 Xkn5cyNbYjrR3lxAvEHYANqQawpktoT9UpCI9j3o/fXahpS9Gsay78SB2MD1hxo3XAWx
 mg0TqC4VzHloDuZokcHHz22YASO1OFR34Mt1n2tEjWgP96t9nl7lnhSvz3Uo0xs/EZuG
 boHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4XAI3k0FxRUdQsyp2h5lwphfk/GwAmAxYvgNnXb2nxw=;
 b=KrFMmARpKNr/jAG5sOQhK/NdwY8dqxqMo/LE7OSmF0EFlSS5qLLQv7PwmOMXj5wscu
 ixzVQFq6RZkDUniNbHsBGdeMookd8CKbGirfulGR26Bx/B01teNgEteBVzXw4aNJSseD
 ZxQvQQqRblgLxLQZWBaBII6r3uiL7l63UnW22IQH30Ehx+3VDuQug0nmPovPBmnj/EFn
 uZ7e6F+hravkNRPeRzPVu+O9YpgR3wztA3BuWw1jDaWUmEyUsM9lYUMPALE7nxf5WFe5
 MkqnbeFvDj9BXkZFzkougVbCsQb9TP0FNZbPMtwDUiWHLzAqDhIILErQP4pQRYLp73qf
 3gTg==
X-Gm-Message-State: AOAM533A6usgoIwnAtuaQl9tKOmj69HWSnL6LpJebP650gUhgxUDyf85
 v8rRuAUaobpuM5R7jXOhoakQLCnN5aDZiLJR
X-Google-Smtp-Source: ABdhPJxpJ/2L9KiroCeGLCAeB+o1S31HeNX46nk7v2X96X1PGtvVeTdjjX4fL95ViL7SX19vvhJ56w==
X-Received: by 2002:adf:9dc5:: with SMTP id q5mr15363412wre.272.1643048815976; 
 Mon, 24 Jan 2022 10:26:55 -0800 (PST)
Received: from [192.168.100.171] ([84.69.122.33])
 by smtp.googlemail.com with ESMTPSA id o26sm14543755wro.9.2022.01.24.10.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:26:55 -0800 (PST)
Message-ID: <7886ff22-03eb-148a-3e2d-1f968bbfa59b@gmail.com>
Date: Mon, 24 Jan 2022 18:26:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: apologies if this DNS conditional forwarding query is a daft
 question
Content-Language: en-GB
To: Frank Carmickle <frank@carmickle.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <c0520a00-cd2b-db1d-b678-4134593e7206@gmail.com>
 <E8EC188A-7643-4843-8289-473D4ACBCE7E@carmickle.com>
From: Simon McNair <simonmcnair@gmail.com>
In-Reply-To: <E8EC188A-7643-4843-8289-473D4ACBCE7E@carmickle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Frank,

Thanks for responding.

My implementation is a mixture of point to point and site to site.

I have laptops and mobile phones which connect directly in, but I also 
have entire class c subnets routing traffic (the only real difference 
being enabling ip routing/bridgining the networks vs no routing and only 
being able to see the single device).

The windows implementation of wireshark only allows a point to point 
connection as windows does not enable routing (in a similar way that I 
don't believe linux does by default).  This can be worked around in 
windows by selecting the adapter and 'sharing' it with the wireshark 
connection (internet connection sharing or ICS).  This means that 
wireshark can see the entire private class c network changing a point 
connection to a site.

My desired result is that each sites class C subnet maintains it's own 
dhcp leases and reverse dns of the same (using the ISP router).  For 
each class C subnet I can configure, per peer, that name resolution 
should go to the appropriate dns server.

In summary each house has an ISP router which does DHCP and DNS, I would 
like to configure each peer to connect via IP to the peers ISP router in 
order to resolve DNS.

I hope that makes sense.

Regards

Simon


On 24/01/2022 13:28, Frank Carmickle wrote:
> Greetings Simon,
>
>> On Jan 24, 2022, at 4:59 AM, Simon McNair <simonmcnair@gmail.com> wrote:
>>
>> Hi,
>> Again apologies if this is networking newb question
>> I have just spent the weekend laboriously learning about wireguard windows and finally powershell & internet connection sharing. My usage case is supporting a parents network and/or sharing resources in a small site(s) to site(s) network.
>> My question is this.  Without buying any extra commodity hardware, or installing any more software is it possible to set up conditional DNS forwarding per peer for DNS ?  I would like each subnets DNS server (in this case isp router) to handle DNS for that subnet.
>>
>> i.e. if the dns request is for a subnet on peer A use DNS server 192.168.100.254 defined in peer A config
>>         if the dns request is made a subnet on peer B use DNS server 192.168.110.254 defined in peer B config
> I'm not totally understanding the topology you are implementing, internet sharing and site to site, that usually means that both sites have internet service. It does seem as though you can accomplish having systems in each subnet use there own DNS by not configuring a DNS directive in the wireguard config at all.
>
> HTH,
> --FC
>
>
>> Similar to this:
>> [Interface]
>> PrivateKey = pkhere
>> ListenPort = 12345
>> Address = 10.250.250.4/24
>>
>> [PeerA]
>> PublicKey = peerpkhere
>> AllowedIPs = 192.168.100.0/24, 10.250.250.0/24
>> Endpoint = my.ddnsalias.net:5678
>> DNS = 192.168.100.254
>>
>> [PeerB]
>> PublicKey = peerpkhere
>> AllowedIPs = 192.168.110.0/24, 10.250.250.0/24
>> Endpoint = my.ddnsalias.net:5678
>> DNS = 192.168.110.254
>>
>> I know we already have the Interface level DNS option but that would fail for peers unless conditional forwarding was configured which isn't possible on most home routers.  I know I can fix this with dnsmasq or a pihole but that requires another machine on all the time.  I was just wondering if anything clever could easily be done within wireguard.  I know it's a big ask but it would be appreciated as an enhancement request.
>>
>> Likewise, for the windows version of wireguard it would be cool if there was an option to enable internet connection sharing on the client.  I have done this successfully (I am happy to share the steps if required) although it was a huge pita and required dangerousscripts enabling which I'm not keen on.
>> Thanks again for all the hard work Jason, I love the app, and it is running happily on my ER-X and making my life better.
>>
>> Regards
>> Simon
>>

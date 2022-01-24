Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60039C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Jan 2022 18:18:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1df86803;
	Mon, 24 Jan 2022 18:18:02 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bc6fd06b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Jan 2022 18:18:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j23so53003421edp.5
 for <wireguard@lists.zx2c4.com>; Mon, 24 Jan 2022 10:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=L87O8ioSJNAYs87tXddt5InHmlcqZGIjXyI4F1Uqy2c=;
 b=eftBc7CRv6lwkeskk6I4JMa0mvTDkoHB8Z5CCxux21UvIOXp8hTHn8jus1jBVGqOwn
 ubCAWPvppS2e0ysO1sOrUCgvP1R0vUUOcqERxBVy2KNetIKNC2lEqIyx6HqjJPtBzS0r
 4o87F6z/CLsmw5T2Xq9nweDdhjzP2B964/uTU9V97JrStQjxUo3sgdbB+cwrHFWIXKD0
 VHsAPvK7TIhwGwaqb+kFoYwOPs0OTW5njTVvwviN5MbTT1/8qA1WyVWxKQN3fUV8VgQV
 qU5yc7BujSccz0suqWRNVg8veXmOnljBUrEoFvy3PTOlXx2IZZuo0tN75v4PSzNOHBVw
 XfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L87O8ioSJNAYs87tXddt5InHmlcqZGIjXyI4F1Uqy2c=;
 b=gwAC/KpkjVxt2v/kHAZw/OcfScOviJw3St6OSrXubykb+1H6Q6fn+q4B5JS/l8W7JT
 jvRLHAYT0H3dgp9BFo42Sgu2PgsBW5vHrS1DjMs/AYAZqJ6IySLYas9cfnC1XXqdMrdr
 IHq6TenAYpfeiScRq+t0EQLWx+q9hDl6ZcRhAd7JwQdn/gGgvJ0cfHiEXAurfEnP2pyu
 SAGuU6HuU/6olYLNoK8jv3v6OpLLCPdzTehnLxGyJALBFasT0Y7zIYhTbpH3K0O1NpMP
 DudZ1v/fl5gObcLsRNIxMNde9rRMUjeR5pAnKX6DAtTI1IntwVMa4eMf6ZKWEoCJrkxE
 n28A==
X-Gm-Message-State: AOAM53352IwPn7RgGflFy5Xz5vHs0VqeTCOH46SkAAt4RPT3dENkQigj
 OC5OwOvgtSeu+1H+YdmDVdfAPY1YzXd5olvl
X-Google-Smtp-Source: ABdhPJxnicM8Ir61tkuzBTIUBytgt75PciCs6pEkdv1jnJp8z3T1v3X/LG+qJCxLNUFOQIlnrD/DlQ==
X-Received: by 2002:aa7:dd59:: with SMTP id o25mr16922167edw.288.1643048280101; 
 Mon, 24 Jan 2022 10:18:00 -0800 (PST)
Received: from [192.168.100.171] ([84.69.122.33])
 by smtp.googlemail.com with ESMTPSA id d25sm5222157ejz.4.2022.01.24.10.17.59
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:17:59 -0800 (PST)
Message-ID: <154d5705-2445-6297-cade-2103738a0667@gmail.com>
Date: Mon, 24 Jan 2022 18:17:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Wireguard Windows Service Issues
Content-Language: en-GB
To: wireguard@lists.zx2c4.com
References: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
 <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
From: Simon McNair <simonmcnair@gmail.com>
In-Reply-To: <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
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

just to insert my 2p.

Provided the service manager is installed whilst the tunnel will not 
appear in the list of tunnels you can view the logfile which will assist 
with diagnosis.

 From my perspective I set up exactly the same set-up myself at the 
weekend and it is behaving as advertised (except not on wifi).

The part of this that makes me curious though is the fact that the 
connection is via wifi so the adapter will stay visible but the 
underlying connection will drop and the ip addresses, DNS etc will 
change behind the scenes with each wireless network they connect to.  I 
would think wireguard would handle this, but the log file would 
certainly be worth of scrutiny.

Also worth thinking around powers aving and the closing of the laptop 
lid putting the adapter in to power saving and dropping the underlying 
connection.

Simon


On 17/01/2022 10:51, Simon Rozman wrote:
> Hi,
>
>> I believe there's a bug in the Windows service implementation, if this
>> issue is by design, it's problematic.
>>
>> I have non-admin users were when I initially set them up with wireguard,
>> I configured it to use the service, using the command:
>>
>> wireguard /installtunnelservice "C:\Program
>> Files\WireGuard\Data\Configurations\vpn.domain.org.conf.dpapi"
>>
>> The tunnel worked fine the first time. Then the user reboots the laptop,
>> or closes it or leaves whatever coffee shop they were at and get
>> disconnected from the wireless network they were using. When this
>> happens, for some reason, the wireguard service then gets torn down
>> never to come back again until I issue the command from my admin account
>> again.
> Can you do the wireguard /dumplog > wireguard.log and investigate.
>
>> There was an issue with some users initial configuration in that they
>> could not query hostname via DNS, so that entering the command to
>> installservice would not even create the service.
> WireGuard services start early on boot - sometimes even before the DNSCache (DNS Client). If the service can't resolve hostnames used in the config file, it will stop. But it will log this. Resolution to this problem is:
> - Use IPs rather than hostnames.
> - Add hostnames you use in your .conf file to C:\Windows\system32\drivers\etc\hosts.
> - Add DNSCache dependency to the WireGuardTunnel$<your tunnel name> service.
>
> I personally would pick one of the first two options above. Don't like the idea my laptop is asking a coffee shop's DNS what is my VPN endpoint IP address.
>
>> Here's a few notes that might help with understanding.
>> - Users must have the VPN established before they log into the active
>> directory servers on the remote network so that they can get all of
>> their GPO directives.
>> - Wireguard Service should stay up so that any time a users connects to
>> any network, the VPN is established immediately after that.
>> - The Wireguard service should also stay because non-admin users cannot
>> create a new service
> I understand. That is exactly how we use WireGuard in our company.
>
>> If this issue is how things will stay, and this is not considered a bug,
>> how would you configure windows non-admin users to tunnel to an
>> enterprise network before login via WireGuard and to continuously try to
>> establish the tunnel while the user is not connected to a network?
> Let me assure you, the behavior you are expecting is definitely pathological. Please investigate the log file why the tunnel service does not persist as it should.
>
> Best regards,
> Simon

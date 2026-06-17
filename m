Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8254CD98E2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2026 15:31:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 10185e7d;
	Wed, 17 Jun 2026 15:31:55 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a7f8cb32
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2026 15:31:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4923139e940so12415495e9.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2026 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1781710309; x=1782315109; darn=lists.zx2c4.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Bypkm7RZae5NgDPIyOzdYR0ybCpGsr/dk5D2llUVjM=;
 b=b3PmODO3OJQg9/QdmYPBwgaifi50/61G1qzLNO4kOhbl5bWcAs3AqGQEhlNfl5HlLg
 zAdIjGlzwpwi2zF7T2XyrpHeWsIlDgI78HHH47zPrEmrMgmMTfMQe6yTzfK1fCn6n8LI
 AqU/FMRzhvZMOZG35ylw8YeDJM2+vyUxQ6sfTGyM6tE3XY104rnoAWYsYTAIYA1blEIL
 jcjJMqTnZJTtQrPjnYqfA7UO/bGt99Z333INLCrkQxXwL17HkFSdtg47gc4LeoQTrOBN
 18jgUldnswHRy5yFMMtwNZLQIfTn/H54M9xgx0cGmMDHr9IyoA2UH01egYE33drFMbc7
 7XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781710309; x=1782315109;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Bypkm7RZae5NgDPIyOzdYR0ybCpGsr/dk5D2llUVjM=;
 b=eCy2X0WnFChAOpdXwiFhPqq79dQ4Htt3hXy0Klk5uFpR3W832d6RdshTEqZojrzWDL
 SXkr4LX85FBd77qz8y3mYsrwJTnvtpFm4BxR5HLHvKB0xedj3Hz0CUeZbmqSIhYOHqcA
 0S4mdRfQu1C6viiw0+YxHMc0mOpkcCIe+LEMPLmdo5Eq3ZhaTvrvbPxQ3W22dtgfWmam
 9aL9XqFdnvvGWqyIO797SmN0/vP+13I2YYlj2KUxuApDGHhKNiwV0hBsQU5t9moSwX6r
 T7aIYjKVsQsaH+QXE67il2EehCBhGiB0EfaMEYAtxgGiNX3iYkHUQes9Xy6rJyneLVwu
 Gpaw==
X-Gm-Message-State: AOJu0Yx81Id4ylmIiDGDQTkwIjNX8L3wgqEl13l7fNgX2NjGUuMio7jV
 XWXa64EEhSkYsSRFMPcf/JlyKT8b7lxs747Zz6wgw3cnxTUv95TM57cA6yQOUQ/xBqcXeJQ+dTl
 aIz4e5MI=
X-Gm-Gg: Acq92OE/I34Th08w8CJI9zgYipC/qDPbEuPtC+nROvctLAw62b8WDgSB8Nj6ze4dCx9
 560sGFVGG5rH/8PscW1fbjnDCNb14P+PEeAVoLS92uGYx030pcfArzmZtgBEQbOmpfuFFmj0HWM
 KOuf9b8ldUXlniNpzDdk4xsYDGCFYQyOb/uRMLOiKeNHK4rIdUwGo6FJSd9ZC5xnbhd+0Cf9C9L
 MEhhboCCOdisYNW3LCiQ/y3KJmIRzmDDcYnKemg7w1pwX8SDg9xvJ8rauO1q0tfzxXJQMJ0kqEw
 dXaapw9EQ3Xfe9HquxI4s4/2wvaW6TJHhQL9rn4ZqB6TVyONPWMQeZvy9ZG5CUO/0jkKzFtw13K
 vRfNKocXZNOs6X62q+cTfoUs393BZ70NXo5rU9Vcwk2QNdVmfJpu33huXl05c/Rnn8zDIizm2ZQ
 s88uZDrizlsv7XP8QaKxQ86RDHxb2vw/SbG7IqSOkWM+mxvCSQPbALkiv75VDP1znSP8AvHAVJf
 B5VdlNNQVo+wAlq/yvf09HIqtk/d3E2VRdaI9F3HTw=
X-Received: by 2002:a05:600c:3f14:b0:490:5466:8591 with SMTP id
 5b1f17b1804b1-49234104b50mr59084595e9.12.1781710308953; 
 Wed, 17 Jun 2026 08:31:48 -0700 (PDT)
Received: from ?IPV6:2003:c7:cf01:4d00:1afb:6ffa:d73a:731d?
 (p200300c7cf014d001afb6ffad73a731d.dip0.t-ipconnect.de.
 [2003:c7:cf01:4d00:1afb:6ffa:d73a:731d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f3dcsm51647980f8f.13.2026.06.17.08.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 08:31:48 -0700 (PDT)
Message-ID: <f30e3fa9-3557-4471-a762-56125d6ae7c0@suse.com>
Date: Wed, 17 Jun 2026 17:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "dns-hatchet: apply resolv.conf's selinux context
 to new resolv.conf"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
References: <20260608133610.108416-1-rfrohl@suse.com>
 <aiw8L3XwjibHS2_-@zx2c4.com>
Content-Language: en-US
From: Robert Frohl <rfrohl@suse.com>
In-Reply-To: <aiw8L3XwjibHS2_-@zx2c4.com>
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

Sorry about the delay, the message ended up in spam and I only found it 
today.

On 6/12/26 7:04 PM, Jason A. Donenfeld wrote:
> On Mon, Jun 08, 2026 at 03:36:10PM +0200, Robert Frohl wrote:
>> This reverts commit 2ce4680bd34f371aacd3c09673c3c907274321cd.
>>
>> selinux does not allow every domain to set file contexts and will raise
>> relabelto/relabelfrom AVCs and block these changes if a domain tries to update
>> the selinux context.
>>
>> It is better to ignore selinux and leave the proper labeling to the
>> selinux policy, which can add proper file transitions for the right
>> context.
> 
> Does any existent selinux policy have anything to handle this? Or is this
> purely speculative/future-facing?

The Fedora selinux policy (which is also the openSUSE upstream) does not 
have anything to handle the DNS hatchet [0]. I did also check the 
refpolicy. There a slightly different wireguard implementation exists 
[1], but the dns-hatchet is not yet covered.
Beyond that I am not sure who else is maintaining a selinux policy and 
may have implemented a solution for wireguard. I briefly checked 
android's sepolicy and I could not find anything regarding wireguard.

More generically I do not think that the manual relabeling in 
hatchet.bash could have ever worked without a change in the respective 
selinux policies, because a process labeling files would need to have 
special privileges to do so. Which would mean in practice that it needs 
specific allow rules in the policy for changing the labels.
At the same time a file transition could automatically assign the 
correct context to the new 'resolv.conf' and would be more concise, as 
it only needs one rule.
Meaning for both the SELinux policy needs to be adjusted.

> 
> Also, wondering if any distros are still shipping the hatchet.


We are shipping a slightly modified version with oS TW [2] and I just 
learned that Fedora disabled the hatchet with Fedora 33 [3].

In that case I would switch my approach to have the DNS hatchet policy 
addition only in our downstream SELinux policy, as it might also explain 
why Fedora was not to keen to have the policy change.


[0] 
https://github.com/fedora-selinux/selinux-policy/blob/rawhide/policy/modules/contrib/wireguard.te
[1] 
https://github.com/SELinuxProject/refpolicy/blob/main/policy/modules/services/wireguard.te
[2] 
https://build.opensuse.org/package/show/network:vpn:wireguard/wireguard-tools
[3] 
https://src.fedoraproject.org/rpms/wireguard-tools/blob/rawhide/f/wireguard-tools.spec#_33

-- 
SELinux Security Engineer, SUSE Software Solutions Germany GmbH, 
Frankenstraße 146, 90461 Nürnberg, Germany, GF: Jochen Jaser, Andrew 
McDonald, Werner Knoblich
GPG: D29F 82AA 9FD5 9D6E 74B1  6370 089E DB3D 230A 2404

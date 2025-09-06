Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F61ACF2564
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 22:44:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8669f972;
	Tue, 18 Nov 2025 17:26:25 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e719991
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757167994;
 bh=SUTg28ZJsRkSXTT3PgjawxQbv7QSVrlXljA/sqN5les=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IibiyyiR36CqAMePCOPEGLevQFe4TV1rnLOTwQc4XOsn988+RmVBF5Upac97jh2AK
 OJ4ifamAu3cgvY2fpNBaifPxEJUZHe2bCI2/UH4L2zVyOi9yMyxFCRG/WCw++y4Wiu
 /6+0vjg2WhTjt6bCDwCJegj9rQM/B6oIjOW569jTWgYTMOYXMA1tXc9XYHEIkJEk1C
 d29e4y5ccZhhIo488E+YV1HSAsTpmh5LFgp61nWlqQxo2TJ/sVpFy79+SK0kAS0syK
 P502Zmb1/WbAuLT1u+sSTYs4roXmNHEDiz24xhccECrXoLdVmZVJhO4zCCFOVHwc+X
 1Ru5Jx8/yXGtw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 76DCB6000C;
 Sat,  6 Sep 2025 14:13:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 880A7201BC9;
 Sat, 06 Sep 2025 14:13:01 +0000 (UTC)
Message-ID: <6e31a9e0-5450-4b45-a557-2aa08d23c25a@fiberby.net>
Date: Sat, 6 Sep 2025 14:13:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] tools: ynl-gen: generate nested array
 policies
To: Jacob Keller <jacob.e.keller@intel.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes.berg@intel.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
 <e24f5baf-7085-4db0-aaad-5318555988b3@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <e24f5baf-7085-4db0-aaad-5318555988b3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

CC: Johannes

On 9/6/25 12:19 AM, Jacob Keller wrote:
> On 9/4/2025 3:01 PM, Asbjørn Sloth Tønnesen wrote:
>> This patch adds support for NLA_POLICY_NESTED_ARRAY() policies.
>>
>> Example spec (from future wireguard.yaml):
>> -
>>    name: wgpeer
>>    attributes:
>>      -
>>        name: allowedips
>>        type: indexed-array
>>        sub-type: nest
>>        nested-attributes: wgallowedip
>>
>> yields NLA_POLICY_NESTED_ARRAY(wireguard_wgallowedip_nl_policy).
>>
>> This doesn't change any currently generated code, as it isn't
>> used in any specs currently used for generating code.
>>
>> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
>> ---
> 
> Is this keyed of off the sub-type? Does you mean that all the existing
> uses of 'sub-type: nest' don't generate code today? Or that this
> _attr_policy implementation is not called yet?

Thanks for the reviews. Yeah, it is a careful wording, because we have
specs matching it, but there aren't any source files that triggers
ynl-gen to generate code based on those specs.

Therefore this patch, doesn't result in any code changes when running:
$ ./tools/net/ynl/ynl-regen.sh -f

Actually ynl-gen generates a fictive "{ .type = NLA_INDEXED_ARRAY, }"
policy, without this patch, leading to a build failure.

> I checked and we have quite a number of uses:
> 
>> $ rg 'sub-type: nest'
>> Documentation/netlink/specs/nlctrl.yaml
 >> [..]
>> Documentation/netlink/specs/tc.yaml
>> [..]
>> Documentation/netlink/specs/rt-link.yaml
>> [..]
>> Documentation/netlink/specs/nl80211.yaml
>> [..]

None of those currently have a generated netlink policy.

These are the netlink policies currently generated by ynl-gen:
$ git grep -h -B1 'YNL-GEN kernel source' | grep '^/\*[^ ]'
/*      Documentation/netlink/specs/dpll.yaml */
/*      Documentation/netlink/specs/ovpn.yaml */
/*      Documentation/netlink/specs/team.yaml */
/*      Documentation/netlink/specs/lockd.yaml */
/*      Documentation/netlink/specs/nfsd.yaml */
/*      Documentation/netlink/specs/netdev.yaml */
/*      Documentation/netlink/specs/devlink.yaml */
/*      Documentation/netlink/specs/handshake.yaml */
/*      Documentation/netlink/specs/fou.yaml */
/*      Documentation/netlink/specs/mptcp_pm.yaml */
/*      Documentation/netlink/specs/net_shaper.yaml */

Johannes introduced NLA_NESTED_ARRAY and the NLA_POLICY_NESTED_ARRAY()
macro in commit 1501d13596b9 for use in nl80211, and it's therefore
used in net/wireless/nl80211.c, but outside of that the macro is
only sparsely adopted (only by mac80211_hwsim.c and nf_tables_api.c).

Wireguard adopts the macro in this RFC patch:
https://lore.kernel.org/netdev/20250904220255.1006675-2-ast@fiberby.net/

package io.crnk.core.repository.foward.strategy;

public interface ForwardingStrategy<T, I , D, J > {

	void init(ForwardingStrategyContext context);

}
